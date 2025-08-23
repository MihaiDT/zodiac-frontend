import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_models.freezed.dart';
part 'onboarding_models.g.dart';

@freezed
class BirthData with _$BirthData {
  const factory BirthData({
    required DateTime birthDate,
    String? birthTime,
    String? birthPlace,
    String? zodiacSign,
  }) = _BirthData;

  factory BirthData.fromJson(Map<String, dynamic> json) =>
      _$BirthDataFromJson(json);
}

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default('balanced') String tone,
    @Default(true) bool dailyNotifications,
    @Default(false) bool weeklyNotifications,
    @Default(false) bool monthlyNotifications,
    @Default(false) bool tarotNotifications,
    @Default(false) bool numerologyNotifications,
    @Default('Europe/Bucharest') String timezone,
    @Default([]) List<String> selectedIntents,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    BirthData? birthData,
    UserPreferences? preferences,
    @Default(0) int currentStep,
    @Default(false) bool isLoading,
    String? error,
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);
}

@freezed
class ZodiacSign with _$ZodiacSign {
  const factory ZodiacSign({
    required String sign,
    required String name,
    required String description,
    required String dateRange,
    required String element,
    required String planet,
  }) = _ZodiacSign;

  factory ZodiacSign.fromJson(Map<String, dynamic> json) =>
      _$ZodiacSignFromJson(json);
}

@freezed
class HoroscopeTeaser with _$HoroscopeTeaser {
  const factory HoroscopeTeaser({
    required String sign,
    required String tone,
    required String content,
    required String date,
  }) = _HoroscopeTeaser;

  factory HoroscopeTeaser.fromJson(Map<String, dynamic> json) =>
      _$HoroscopeTeaserFromJson(json);
}

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    required ProfileData profile,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}

@freezed
class ProfileData with _$ProfileData {
  const factory ProfileData({
    required String birthDate,
    String? birthTime,
    String? birthPlace,
    String? zodiacSign,
    String? tone,
    NotificationSettings? notifications,
    String? timezone,
    @Default([]) List<String> selectedIntents,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}

@freezed
class ProfileUpdateRequest with _$ProfileUpdateRequest {
  const factory ProfileUpdateRequest({
    required String tone,
    required NotificationSettings notifications,
    required String timezone,
    String? birthDate,
    String? birthTime,
    String? birthPlace,
    String? zodiacSign,
  }) = _ProfileUpdateRequest;

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestFromJson(json);
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    required bool daily,
    required bool weekly,
    required bool monthly,
    required bool tarot,
    required bool numerology,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsFromJson(json);
}
