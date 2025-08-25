// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BirthDataImpl _$$BirthDataImplFromJson(Map<String, dynamic> json) =>
    _$BirthDataImpl(
      birthDate: DateTime.parse(json['birthDate'] as String),
      birthTime: json['birthTime'] as String?,
      birthPlace: json['birthPlace'] as String?,
      zodiacSign: json['zodiacSign'] as String?,
    );

Map<String, dynamic> _$$BirthDataImplToJson(_$BirthDataImpl instance) =>
    <String, dynamic>{
      'birthDate': instance.birthDate.toIso8601String(),
      'birthTime': instance.birthTime,
      'birthPlace': instance.birthPlace,
      'zodiacSign': instance.zodiacSign,
    };

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
  Map<String, dynamic> json,
) => _$UserPreferencesImpl(
  tone: json['tone'] as String? ?? 'balanced',
  dailyNotifications: json['dailyNotifications'] as bool? ?? true,
  weeklyNotifications: json['weeklyNotifications'] as bool? ?? false,
  monthlyNotifications: json['monthlyNotifications'] as bool? ?? false,
  tarotNotifications: json['tarotNotifications'] as bool? ?? false,
  numerologyNotifications: json['numerologyNotifications'] as bool? ?? false,
  timezone: json['timezone'] as String? ?? 'Europe/Bucharest',
  selectedIntents:
      (json['selectedIntents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$UserPreferencesImplToJson(
  _$UserPreferencesImpl instance,
) => <String, dynamic>{
  'tone': instance.tone,
  'dailyNotifications': instance.dailyNotifications,
  'weeklyNotifications': instance.weeklyNotifications,
  'monthlyNotifications': instance.monthlyNotifications,
  'tarotNotifications': instance.tarotNotifications,
  'numerologyNotifications': instance.numerologyNotifications,
  'timezone': instance.timezone,
  'selectedIntents': instance.selectedIntents,
};

_$OnboardingStateImpl _$$OnboardingStateImplFromJson(
  Map<String, dynamic> json,
) => _$OnboardingStateImpl(
  birthData:
      json['birthData'] == null
          ? null
          : BirthData.fromJson(json['birthData'] as Map<String, dynamic>),
  preferences:
      json['preferences'] == null
          ? null
          : UserPreferences.fromJson(
            json['preferences'] as Map<String, dynamic>,
          ),
  currentStep: (json['currentStep'] as num?)?.toInt() ?? 0,
  isLoading: json['isLoading'] as bool? ?? false,
  error: json['error'] as String?,
);

Map<String, dynamic> _$$OnboardingStateImplToJson(
  _$OnboardingStateImpl instance,
) => <String, dynamic>{
  'birthData': instance.birthData,
  'preferences': instance.preferences,
  'currentStep': instance.currentStep,
  'isLoading': instance.isLoading,
  'error': instance.error,
};

_$ZodiacSignImpl _$$ZodiacSignImplFromJson(Map<String, dynamic> json) =>
    _$ZodiacSignImpl(
      sign: json['sign'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      dateRange: json['dateRange'] as String,
      element: json['element'] as String,
      planet: json['planet'] as String,
    );

Map<String, dynamic> _$$ZodiacSignImplToJson(_$ZodiacSignImpl instance) =>
    <String, dynamic>{
      'sign': instance.sign,
      'name': instance.name,
      'description': instance.description,
      'dateRange': instance.dateRange,
      'element': instance.element,
      'planet': instance.planet,
    };

_$HoroscopeTeaserImpl _$$HoroscopeTeaserImplFromJson(
  Map<String, dynamic> json,
) => _$HoroscopeTeaserImpl(
  sign: json['sign'] as String,
  tone: json['tone'] as String,
  content: json['content'] as String,
  date: json['date'] as String,
);

Map<String, dynamic> _$$HoroscopeTeaserImplToJson(
  _$HoroscopeTeaserImpl instance,
) => <String, dynamic>{
  'sign': instance.sign,
  'tone': instance.tone,
  'content': instance.content,
  'date': instance.date,
};

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterRequestImpl(
  email: json['email'] as String,
  password: json['password'] as String,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  profile: ProfileData.fromJson(json['profile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$RegisterRequestImplToJson(
  _$RegisterRequestImpl instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'profile': instance.profile,
};

_$ProfileDataImpl _$$ProfileDataImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDataImpl(
      birthDate: json['birthDate'] as String,
      birthTime: json['birthTime'] as String?,
      birthPlace: json['birthPlace'] as String?,
      zodiacSign: json['zodiacSign'] as String?,
      tone: json['tone'] as String?,
      notifications:
          json['notifications'] == null
              ? null
              : NotificationSettings.fromJson(
                json['notifications'] as Map<String, dynamic>,
              ),
      timezone: json['timezone'] as String?,
      selectedIntents:
          (json['selectedIntents'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProfileDataImplToJson(_$ProfileDataImpl instance) =>
    <String, dynamic>{
      'birthDate': instance.birthDate,
      'birthTime': instance.birthTime,
      'birthPlace': instance.birthPlace,
      'zodiacSign': instance.zodiacSign,
      'tone': instance.tone,
      'notifications': instance.notifications,
      'timezone': instance.timezone,
      'selectedIntents': instance.selectedIntents,
    };

_$ProfileUpdateRequestImpl _$$ProfileUpdateRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ProfileUpdateRequestImpl(
  tone: json['tone'] as String,
  notifications: NotificationSettings.fromJson(
    json['notifications'] as Map<String, dynamic>,
  ),
  timezone: json['timezone'] as String,
  birthDate: json['birthDate'] as String?,
  birthTime: json['birthTime'] as String?,
  birthPlace: json['birthPlace'] as String?,
  zodiacSign: json['zodiacSign'] as String?,
);

Map<String, dynamic> _$$ProfileUpdateRequestImplToJson(
  _$ProfileUpdateRequestImpl instance,
) => <String, dynamic>{
  'tone': instance.tone,
  'notifications': instance.notifications,
  'timezone': instance.timezone,
  'birthDate': instance.birthDate,
  'birthTime': instance.birthTime,
  'birthPlace': instance.birthPlace,
  'zodiacSign': instance.zodiacSign,
};

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationSettingsImpl(
  daily: json['daily'] as bool,
  weekly: json['weekly'] as bool,
  monthly: json['monthly'] as bool,
  tarot: json['tarot'] as bool,
  numerology: json['numerology'] as bool,
);

Map<String, dynamic> _$$NotificationSettingsImplToJson(
  _$NotificationSettingsImpl instance,
) => <String, dynamic>{
  'daily': instance.daily,
  'weekly': instance.weekly,
  'monthly': instance.monthly,
  'tarot': instance.tarot,
  'numerology': instance.numerology,
};
