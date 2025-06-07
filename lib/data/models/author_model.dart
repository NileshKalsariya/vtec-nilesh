import 'package:equatable/equatable.dart';
import 'level_model.dart';

class AuthorModel extends Equatable {
  final int id;
  final String username;
  final String email;
  final String birthday;
  final String location;
  final String description;
  final String hobbies;
  final String job;
  final String imgPath;
  final String? appleId;
  final String? googleId;
  final int? otp;
  final String? otpExpiry;
  final int isVerified;
  final String active;
  final String? stripeCustomerId;
  final List<int> routesStarredIds;
  final LevelModel level;

  const AuthorModel({
    required this.id,
    required this.username,
    required this.email,
    required this.birthday,
    required this.location,
    required this.description,
    required this.hobbies,
    required this.job,
    required this.imgPath,
    this.appleId,
    this.googleId,
    this.otp,
    this.otpExpiry,
    required this.isVerified,
    required this.active,
    this.stripeCustomerId,
    required this.routesStarredIds,
    required this.level,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      birthday: json['birthday'] ?? '',
      location: json['location'] ?? '',
      description: json['description'] ?? '',
      hobbies: json['hobbies'] ?? '',
      job: json['job'] ?? '',
      imgPath: json['img_path'] ?? '',
      appleId: json['apple_id'],
      googleId: json['google_id'],
      otp: json['otp'],
      otpExpiry: json['otp_expiry'],
      isVerified: json['is_verified'] ?? 0,
      active: json['active'] ?? 'no',
      stripeCustomerId: json['stripe_customer_id'],
      routesStarredIds: List<int>.from(json['routes_starred_ids'] ?? []),
      level: LevelModel.fromJson(json['level'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'birthday': birthday,
      'location': location,
      'description': description,
      'hobbies': hobbies,
      'job': job,
      'img_path': imgPath,
      'apple_id': appleId,
      'google_id': googleId,
      'otp': otp,
      'otp_expiry': otpExpiry,
      'is_verified': isVerified,
      'active': active,
      'stripe_customer_id': stripeCustomerId,
      'routes_starred_ids': routesStarredIds,
      'level': level.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        birthday,
        location,
        description,
        hobbies,
        job,
        imgPath,
        appleId,
        googleId,
        otp,
        otpExpiry,
        isVerified,
        active,
        stripeCustomerId,
        routesStarredIds,
        level,
      ];
} 