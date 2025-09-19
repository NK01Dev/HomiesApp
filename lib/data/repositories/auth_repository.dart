import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homies_app/core/constants/utils.dart' show logMsg;
import 'package:homies_app/core/errors/exceptions.dart';
import 'package:homies_app/core/services/supabase_service.dart';
import 'package:homies_app/data/datasources/remote_data_source.dart';
import 'package:homies_app/data/models/user_model.dart';
import 'package:homies_app/domain/entities/user_entity.dart';
import 'package:homies_app/domain/repositories/AuthRepositoryInterface.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart' hide AuthException;

class AuthRepositoryImpl implements AuthRepository {
  // inject Supabase service in
  final SupabaseService _supabase;
  final RemoteDataSource _remoteDataSource;
  AuthRepositoryImpl(this._supabase, this._remoteDataSource);

  GoTrueClient get _auth => _supabase.auth;

  // Méthode pour hasher le mot de passe
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return null;

      return await _remoteDataSource.getUserById(currentUser.id);
    } catch (e) {
      return null;
    }
  }

// AuthRepositoryImpl.dart

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      // 1. Authenticate the user with Supabase.
      final response = await _auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw AuthException('Invalid credentials');
      }

      // 2. Attempt to fetch the user profile from your 'users' table.
      UserModel? user = await _remoteDataSource.getUserById(response.user!.id);

      // 3. If the user profile is NOT found, create it now.
      if (user == null) {
        // Create a default UserModel
        final newUser = UserModel(
          id: response.user!.id,
          email: email,
          userName: response.user!.userMetadata?['user_name'] ?? '', // Use username from auth metadata
          // Set other default fields
          firstName: '',
          lastName: '',
          passwordHash: '', // Store a placeholder or handle this securely
          phoneNumber: '',
          dateOfBirth: null,
          gender: null,
          isActive: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // Call createUser to insert the new profile into your 'users' table.
        user = await _remoteDataSource.createUser(newUser);
      }

      // 4. Update the last login time.
      await _remoteDataSource.updateUser(user.id, {
        'last_login_at': DateTime.now().toIso8601String(),
      });

      return user;
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw AuthException('Sign in failed: $e');
    }
  }
  @override
  Future<void> signOut() async {
    // TODO: implement signOut
    try {
      await _supabase.signOut();
    } catch (e) {
      throw AuthException('Sign out failed: $e');
    }
  }

  // AuthRepositoryImpl.dart
// AuthRepositoryImpl.dart
  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final authResponse = await _auth.signUp(email: email, password: password);

      if (authResponse.user == null) {
        throw Exception('User creation failed');
      }

      final String userId = authResponse.user!.id;
      final hashedPassword = _hashPassword(password);

      // Create the user profile first
      final userModel = UserModel(
        id: userId, // Use the ID from the auth response
        email: email,
        firstName: '',
        lastName: '',
        passwordHash: hashedPassword,
        phoneNumber: '',
        dateOfBirth: null,
        gender: null,
        userName: userName,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Call createUser to insert the profile into your 'users' table.
      final createdUser = await _remoteDataSource.createUser(userModel);

      // Now, return the created user model.
      return createdUser;

    } on AuthException catch (e) {
      logMsg('Registration error: $e');
      throw AuthException(e.message);
    } on PostgrestException catch (e) {
      logMsg('Postgrest error during sign up: $e');
      throw ServerException(e.message);
    } catch (e) {
      logMsg('General error during sign up: $e');
      throw AuthException('Sign up failed: $e');
    }
  }

  @override
  Future<void> resetPassword(String email)async  {
    try {
      await _auth.resetPasswordForEmail(email);
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw AuthException('Password reset failed: $e');
    }
  }

  @override
  Future<void> updateUserProfile(Map<String, dynamic> updates) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw AuthException('No authenticated user');
      }

      await _remoteDataSource.updateUser(currentUser.id, updates);
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Stream<UserEntity?> get userStream {
    return _auth.onAuthStateChange.map((authState) async {
      final user = authState.session?.user;
      if (user == null) return null;

      return await _remoteDataSource.getUserById(user.id);
    }).asyncMap((event) => event);
  }
}
