// lib/data/models/user_model.dart
import 'package:homies_app/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String email,
     String? passwordHash,
    required String userName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? gender,
    String? bio,
    String? avatarUrl,
    String? preferredLanguage,
    String? timezone,
    bool? isActive,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
    id: id,
    email: email,
    passwordHash: passwordHash,
    userName: userName,
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    dateOfBirth: dateOfBirth,
    gender: gender,
    bio: bio,
    avatarUrl: avatarUrl,
    preferredLanguage: preferredLanguage,
    timezone: timezone,
    isActive: isActive,
    lastLoginAt: lastLoginAt,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
