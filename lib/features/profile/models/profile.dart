import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String email,
    required String name,
    String? firstName,
    String? lastName,
    String? birthdate,
    String? zodiacSign,
    String? avatar,
    required ProfileSettings settings,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class ProfileSettings with _$ProfileSettings {
  const factory ProfileSettings({
    required NotificationSettings notifications,
    @Default('serious') String horoscopeTone,
    @Default(true) bool analyticsEnabled,
    @Default('en') String language,
    @Default('UTC') String timezone,
  }) = _ProfileSettings;

  factory ProfileSettings.fromJson(Map<String, dynamic> json) =>
      _$ProfileSettingsFromJson(json);
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    required bool dailyHoroscope,
    required bool weeklyForecast,
    required bool monthlyInsights,
    required bool numerologyUpdates,
    required bool specialEvents,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsFromJson(json);
}

@freezed
class ProfileUpdateRequest with _$ProfileUpdateRequest {
  const factory ProfileUpdateRequest({
    String? firstName,
    String? lastName,
    String? birthdate,
    String? zodiacSign,
    ProfileSettings? settings,
  }) = _ProfileUpdateRequest;

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestFromJson(json);
}
