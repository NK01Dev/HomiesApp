import 'package:homies_app/core/errors/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/services/supabase_service.dart';
import '../models/user_model.dart';

class RemoteDataSource {
  final SupabaseService _supabaseService;

  RemoteDataSource(this._supabaseService);

  SupabaseClient get _client => _supabaseService.client;

  //
  Future<UserModel> createUser(UserModel user) async {
    try {
      final response = await _client
          .from('users')
          .insert(user.toJson())
          .select()
          .single(); // Removed .execute()

      return UserModel.fromJson(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException('Failed to create user: $e');
    }
  }
//
  Future<UserModel?> getUserById(String userId) async {
    try {
      final response = await _client
          .from('users')
          .select()
          .eq('id', userId)
          .single(); // Removed .execute()

      return UserModel.fromJson(response);
    } on PostgrestException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }
//
  Future<void> updateUser(String userId, Map<String, dynamic> updates) async {
    try {
      await _client
          .from('users')
          .update(updates)
          .eq('id', userId); // Removed .execute()
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}