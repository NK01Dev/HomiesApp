import 'package:homies_app/data/models/user_model.dart';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserModel> signUp(String email, String password, String firstName, String lastName);
  Future<UserModel> signIn(String email, String password);
  Future<void> signOut();
  Future<UserModel?> getCurrentUser();
}