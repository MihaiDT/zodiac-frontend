// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
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
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'birthDate': instance.birthDate?.toIso8601String(),
      'zodiacSign': instance.zodiacSign,
      'lifePath': instance.lifePath,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
