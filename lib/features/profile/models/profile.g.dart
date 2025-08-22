// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      birthdate: json['birthdate'] as String?,
      zodiacSign: json['zodiacSign'] as String?,
      avatar: json['avatar'] as String?,
      settings: ProfileSettings.fromJson(
        json['settings'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthdate': instance.birthdate,
      'zodiacSign': instance.zodiacSign,
      'avatar': instance.avatar,
      'settings': instance.settings,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$ProfileSettingsImpl _$$ProfileSettingsImplFromJson(
  Map<String, dynamic> json,
) => _$ProfileSettingsImpl(
  notifications: NotificationSettings.fromJson(
    json['notifications'] as Map<String, dynamic>,
  ),
  horoscopeTone: json['horoscopeTone'] as String? ?? 'serious',
  analyticsEnabled: json['analyticsEnabled'] as bool? ?? true,
  language: json['language'] as String? ?? 'en',
  timezone: json['timezone'] as String? ?? 'UTC',
);

Map<String, dynamic> _$$ProfileSettingsImplToJson(
  _$ProfileSettingsImpl instance,
) => <String, dynamic>{
  'notifications': instance.notifications,
  'horoscopeTone': instance.horoscopeTone,
  'analyticsEnabled': instance.analyticsEnabled,
  'language': instance.language,
  'timezone': instance.timezone,
};

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationSettingsImpl(
  dailyHoroscope: json['dailyHoroscope'] as bool,
  weeklyForecast: json['weeklyForecast'] as bool,
  monthlyInsights: json['monthlyInsights'] as bool,
  numerologyUpdates: json['numerologyUpdates'] as bool,
  specialEvents: json['specialEvents'] as bool,
);

Map<String, dynamic> _$$NotificationSettingsImplToJson(
  _$NotificationSettingsImpl instance,
) => <String, dynamic>{
  'dailyHoroscope': instance.dailyHoroscope,
  'weeklyForecast': instance.weeklyForecast,
  'monthlyInsights': instance.monthlyInsights,
  'numerologyUpdates': instance.numerologyUpdates,
  'specialEvents': instance.specialEvents,
};

_$ProfileUpdateRequestImpl _$$ProfileUpdateRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ProfileUpdateRequestImpl(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  birthdate: json['birthdate'] as String?,
  zodiacSign: json['zodiacSign'] as String?,
  settings:
      json['settings'] == null
          ? null
          : ProfileSettings.fromJson(json['settings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ProfileUpdateRequestImplToJson(
  _$ProfileUpdateRequestImpl instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'birthdate': instance.birthdate,
  'zodiacSign': instance.zodiacSign,
  'settings': instance.settings,
};
