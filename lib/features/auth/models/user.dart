import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    String? displayName,
    String? firstName,
    String? lastName,
    String? avatar,
    DateTime? birthDate,
    String? zodiacSign,
    String? lifePath,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? emailVerified,
    String? accountStatus,
    DateTime? lastLoginAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserExtensions on User {
  String toJsonString() {
    return jsonEncode(toJson());
  }

  static User fromJsonString(String jsonString) {
    return User.fromJson(jsonDecode(jsonString));
  }
}
