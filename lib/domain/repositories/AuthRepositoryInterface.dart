import 'package:homies_app/data/models/user_model.dart';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String userName,
  });  Future<UserEntity> signIn(String email, String password);
  Future<void> signOut();
  Future<UserEntity?> getCurrentUser();

  Future<void> resetPassword(String email);


  Stream<UserEntity?> get userStream;

  Future<void> updateUserProfile(Map<String, dynamic> updates);

}