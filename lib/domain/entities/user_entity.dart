  import 'package:equatable/equatable.dart';

  class UserEntity extends Equatable {
    final String id;
    final String email;
    final String passwordHash;
    final String? firstName; // Make optional
    final String? lastName;  // Make optional
    final String userName;
    final String? phoneNumber;
    final DateTime? dateOfBirth;
    final String? gender;
    final String? bio;
    final String? avatarUrl;
    final String? preferredLanguage;
    final String? timezone;
    final bool? isActive;
    final DateTime? lastLoginAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    const UserEntity({
      required this.id,
      required this.email,
      required this.passwordHash,
      required this.userName, // Add required userName
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.dateOfBirth,
      this.gender,
      this.bio,
      this.avatarUrl,
      this.preferredLanguage,
      this.timezone,
      this.isActive,
      this.lastLoginAt,
      this.createdAt,
      this.updatedAt,
    });

    @override
    List<Object?> get props => [
      id,
      email,
      passwordHash,
      userName, // Add to props
      firstName,
      lastName,
      phoneNumber,
      dateOfBirth,
      gender,
      bio,
      avatarUrl,
      preferredLanguage,
      timezone,
      isActive,
      lastLoginAt,
      createdAt,
      updatedAt,
    ];
  }
