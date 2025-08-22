// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zodiac_sign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalityImpl _$$PersonalityImplFromJson(Map<String, dynamic> json) =>
    _$PersonalityImpl(
      strengths:
          (json['strengths'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      weaknesses:
          (json['weaknesses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$PersonalityImplToJson(_$PersonalityImpl instance) =>
    <String, dynamic>{
      'strengths': instance.strengths,
      'weaknesses': instance.weaknesses,
      'description': instance.description,
    };

_$ZodiacSignImpl _$$ZodiacSignImplFromJson(
  Map<String, dynamic> json,
) => _$ZodiacSignImpl(
  name: json['name'] as String,
  symbol: json['symbol'] as String,
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  element: json['element'] as String,
  quality: json['quality'] as String,
  rulingPlanet: json['ruling_planet'] as String,
  image: json['image'] as String?,
  description: json['description'] as String? ?? '',
  traits:
      (json['traits'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  compatibility: json['compatibility'] as String? ?? '',
  personality:
      json['personality'] == null
          ? null
          : Personality.fromJson(json['personality'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ZodiacSignImplToJson(_$ZodiacSignImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'symbol': instance.symbol,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'element': instance.element,
      'quality': instance.quality,
      'ruling_planet': instance.rulingPlanet,
      'image': instance.image,
      'description': instance.description,
      'traits': instance.traits,
      'compatibility': instance.compatibility,
      'personality': instance.personality,
    };
