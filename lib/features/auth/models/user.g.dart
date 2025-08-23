// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  displayName: json['displayName'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  avatar: json['avatar'] as String?,
  birthDate:
      json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
  zodiacSign: json['zodiacSign'] as String?,
  lifePath: json['lifePath'] as String?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  emailVerified: json['emailVerified'] as bool?,
  accountStatus: json['accountStatus'] as String?,
  lastLoginAt:
      json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'displayName': instance.displayName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
      'birthDate': instance.birthDate?.toIso8601String(),
      'zodiacSign': instance.zodiacSign,
      'lifePath': instance.lifePath,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'emailVerified': instance.emailVerified,
      'accountStatus': instance.accountStatus,
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
    };
