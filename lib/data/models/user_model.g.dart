// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  passwordHash: json['passwordHash'] as String,
  userName: json['userName'] as String,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  gender: json['gender'] as String?,
  bio: json['bio'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  preferredLanguage: json['preferredLanguage'] as String?,
  timezone: json['timezone'] as String?,
  isActive: json['isActive'] as bool?,
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'passwordHash': instance.passwordHash,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'userName': instance.userName,
  'phoneNumber': instance.phoneNumber,
  'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
  'gender': instance.gender,
  'bio': instance.bio,
  'avatarUrl': instance.avatarUrl,
  'preferredLanguage': instance.preferredLanguage,
  'timezone': instance.timezone,
  'isActive': instance.isActive,
  'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
