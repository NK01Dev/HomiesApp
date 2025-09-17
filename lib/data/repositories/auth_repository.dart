import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homies_app/core/constants/utils.dart' show logMsg;
import 'package:homies_app/core/services/supabase_service.dart';
import 'package:homies_app/data/models/user_model.dart';
import 'package:homies_app/domain/entities/user_entity.dart';
import 'package:homies_app/domain/repositories/AuthRepositoryInterface.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class AuthRepositoryImpl  implements AuthRepository {
  // inject Supabase service in
  final SupabaseService _supabase = Get.find<SupabaseService>();
  // Méthode pour hasher le mot de passe
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    // TODO: implement getCurrentUser
    final currentUser = _supabase.auth.currentUser;
    if (currentUser == null) return null;
    try {
      final userData = await _supabase.client
          .from('users')
          .select()
          .eq('id', currentUser.id)
          .single();

      return UserModel.fromJson(userData);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<UserModel> signIn(String email, String password)async {
    // TODO: implement signIn
try {
  final AuthResponse authResponse = await _supabase.auth.signInWithPassword(
    email:email,
    password: password,
  );
  if (authResponse.user == null) {
    throw Exception('Sign in failed');
  }
  // Fetch user profile from database
  final userData = await _supabase.client
      .from('users')
      .select()
      .eq('id', authResponse.user!.id)
      .maybeSingle();
  if (userData == null) {
    // This means the user exists in auth.users but not in your public.users table.
    // This is a critical state that you must handle.
    throw Exception('User profile not found. Please contact support.');
  }
  return UserModel.fromJson(userData);
} catch (e){
  throw Exception('Sign in failed: $e');

}

  }

  @override
  Future<void> signOut() async {
    // TODO: implement signOut
    await _supabase.auth.signOut();  }

// AuthRepositoryImpl.dart
  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final authResponse = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'user_name': userName,
        },
      );

      if (authResponse.user == null) {
        throw Exception('User creation failed');
      }

      final String userId = authResponse.user!.id;
      // Hasher le mot de passe avant de l'insérer
      final hashedPassword = _hashPassword(password);
      // Insert user profile with only essential data
      final userData = {
        'id': userId,
        'email': email,
        'user_name': userName,
        'password_hash': hashedPassword, // ✅ Maintenant fourni

        'first_name': '', // Empty for now
        'last_name': '',  // Empty for now
        'preferred_language': 'en',
        'timezone': 'UTC',
        'is_active': true,
      };

      final insertedUser = await _supabase.client
          .from('users')
          .insert(userData)
          .select()
          .single();

      return UserModel.fromJson(insertedUser);

    } catch (e, stackTrace) {
      logMsg('SignUp error details: $e');
      logMsg('Stack trace: $stackTrace');

      // Message d'erreur plus spécifique
      if (e.toString().contains('password_hash')) {
        logMsg('Stack trace: $stackTrace');

        throw Exception('Database configuration error. Please contact support.');
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        throw Exception('Network error. Please check your connection and try again.');
      } else if (e.toString().contains('unique') || e.toString().contains('duplicate')) {
        throw Exception('Email or username already exists. Please try different credentials.');
      } else {
        throw Exception('Registration failed: ${e.toString()}');
      }
    }
  }
}