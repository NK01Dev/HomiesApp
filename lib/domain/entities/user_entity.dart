// domain/entities/user.dart
import 'package:meta/meta.dart';

class UserEntity {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? bio;
  final String? avatarUrl;
  final String preferredLanguage;
  final String timezone;
  final bool isActive;
  final DateTime? lastLoginAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
    this.bio,
    this.avatarUrl,
    this.preferredLanguage = 'en',
    this.timezone = 'UTC',
    this.isActive = true,
    this.lastLoginAt,
    required this.createdAt,
    required this.updatedAt,
  });

  // Copy with method for immutability
  UserEntity copyWith({
    String? id,
    String? email,
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
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      bio: bio ?? this.bio,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      timezone: timezone ?? this.timezone,
      isActive: isActive ?? this.isActive,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
