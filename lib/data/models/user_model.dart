import 'package:homies_app/domain/entities/user_entity.dart';


class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
    super.phoneNumber,
    super.dateOfBirth,
    super.gender,
    super.bio,
    super.avatarUrl,
    super.preferredLanguage,
    super.timezone,
    super.isActive,
    super.lastLoginAt,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      dateOfBirth: json['date_of_birth'] != null
          ? DateTime.parse(json['date_of_birth'])
          : null,
      gender: json['gender'],
      bio: json['bio'],
      avatarUrl: json['avatar_url'],
      preferredLanguage: json['preferred_language'],
      timezone: json['timezone'],
      isActive: json['is_active'],
      lastLoginAt: json['last_login_at'] != null
          ? DateTime.parse(json['last_login_at'])
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'date_of_birth': dateOfBirth?.toIso8601String(),
      'gender': gender,
      'bio': bio,
      'avatar_url': avatarUrl,
      'preferred_language': preferredLanguage,
      'timezone': timezone,
      'is_active': isActive,
      'last_login_at': lastLoginAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  // Helper for creating a new user model for registration
  factory UserModel.createNew({
    required String email,
    required String firstName,
    required String lastName,
  }) {
    return UserModel(
      id: const Uuid().v4(), // Generate a UUID for a new user
      email: email,
      firstName: firstName,
      lastName: lastName,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isActive: true,
      preferredLanguage: 'en',
      timezone: 'UTC',
    );
  }
}