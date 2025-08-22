// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'numerology.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NumerologyRequestImpl _$$NumerologyRequestImplFromJson(
  Map<String, dynamic> json,
) => _$NumerologyRequestImpl(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  birthdate: json['birthdate'] as String,
);

Map<String, dynamic> _$$NumerologyRequestImplToJson(
  _$NumerologyRequestImpl instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'birthdate': instance.birthdate,
};

_$KeyFiguresResponseImpl _$$KeyFiguresResponseImplFromJson(
  Map<String, dynamic> json,
) => _$KeyFiguresResponseImpl(
  lifePathNumber: (json['lifePathNumber'] as num).toInt(),
  expressionNumber: (json['expressionNumber'] as num).toInt(),
  soulUrgeNumber: (json['soulUrgeNumber'] as num).toInt(),
  personalityNumber: (json['personalityNumber'] as num).toInt(),
  birthdayNumber: (json['birthdayNumber'] as num).toInt(),
  name: json['name'] as String,
  birthdate: json['birthdate'] as String,
);

Map<String, dynamic> _$$KeyFiguresResponseImplToJson(
  _$KeyFiguresResponseImpl instance,
) => <String, dynamic>{
  'lifePathNumber': instance.lifePathNumber,
  'expressionNumber': instance.expressionNumber,
  'soulUrgeNumber': instance.soulUrgeNumber,
  'personalityNumber': instance.personalityNumber,
  'birthdayNumber': instance.birthdayNumber,
  'name': instance.name,
  'birthdate': instance.birthdate,
};

_$InterpretationsResponseImpl _$$InterpretationsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$InterpretationsResponseImpl(
  interpretations: Map<String, String>.from(json['interpretations'] as Map),
  overallReading: json['overallReading'] as String,
  strengths:
      (json['strengths'] as List<dynamic>).map((e) => e as String).toList(),
  challenges:
      (json['challenges'] as List<dynamic>).map((e) => e as String).toList(),
  advice: json['advice'] as String,
);

Map<String, dynamic> _$$InterpretationsResponseImplToJson(
  _$InterpretationsResponseImpl instance,
) => <String, dynamic>{
  'interpretations': instance.interpretations,
  'overallReading': instance.overallReading,
  'strengths': instance.strengths,
  'challenges': instance.challenges,
  'advice': instance.advice,
};
