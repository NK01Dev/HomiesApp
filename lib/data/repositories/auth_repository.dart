import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homies_app/core/services/supabase_service.dart';
import 'package:homies_app/data/models/user_model.dart';
import 'package:homies_app/domain/entities/user_entity.dart';
import 'package:homies_app/domain/repositories/AuthRepositoryInterface.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class AuthRepositoryImpl  implements AuthRepository {
  // inject Supabase service in
  final SupabaseService _supabase = Get.find<SupabaseService>();

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
      .single();

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

      // Insert user profile with only essential data
      final userData = {
        'id': userId,
        'email': email,
        'user_name': userName,
        'password_hash': password, // Note: You should hash this properly
        'first_name': '', // Empty for now
        'last_name': '',  // Empty for now
        'preferred_language': 'en',
        'created_at': DateTime.now().toIso8601String(),
      };

      await _supabase.client
          .from('users')
          .insert(userData);

      return UserModel.fromJson(userData);
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }
}