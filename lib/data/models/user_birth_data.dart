import 'package:flutter/material.dart';

class UserBirthData {
  final DateTime birthDate;
  final TimeOfDay? birthTime;
  final String? birthPlace;

  const UserBirthData({
    required this.birthDate,
    this.birthTime,
    this.birthPlace,
  });

  Map<String, dynamic> toJson() {
    return {
      'birthDate': birthDate.toIso8601String(),
      'birthTime':
          birthTime != null
              ? '${birthTime!.hour.toString().padLeft(2, '0')}:${birthTime!.minute.toString().padLeft(2, '0')}'
              : null,
      'birthPlace': birthPlace,
    };
  }

  factory UserBirthData.fromJson(Map<String, dynamic> json) {
    TimeOfDay? timeOfDay;
    if (json['birthTime'] != null) {
      final parts = json['birthTime'].split(':');
      timeOfDay = TimeOfDay(
        hour: int.parse(parts[0]),
        minute: int.parse(parts[1]),
      );
    }

    return UserBirthData(
      birthDate: DateTime.parse(json['birthDate']),
      birthTime: timeOfDay,
      birthPlace: json['birthPlace'],
    );
  }
}

class UserProfileResult {
  final String zodiacSign;
  final String? moonSign;
  final String? ascendantSign;

  const UserProfileResult({
    required this.zodiacSign,
    this.moonSign,
    this.ascendantSign,
  });

  factory UserProfileResult.fromJson(Map<String, dynamic> json) {
    return UserProfileResult(
      zodiacSign: json['sun_sign'] ?? json['zodiacSign'] ?? 'Unknown',
      moonSign: json['moon_sign'],
      ascendantSign: json['rising_sign'] ?? json['ascendantSign'],
    );
  }
}
