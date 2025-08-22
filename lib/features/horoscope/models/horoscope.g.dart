// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horoscope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HoroscopeResponseImpl _$$HoroscopeResponseImplFromJson(
  Map<String, dynamic> json,
) => _$HoroscopeResponseImpl(
  sign: json['sign'] as String,
  tone: json['tone'] as String,
  prediction: json['prediction'] as String,
  date: json['date'] as String,
  luckyNumbers:
      (json['luckyNumbers'] as List<dynamic>).map((e) => e as String).toList(),
  luckyColor: json['luckyColor'] as String,
  advice: json['advice'] as String?,
);

Map<String, dynamic> _$$HoroscopeResponseImplToJson(
  _$HoroscopeResponseImpl instance,
) => <String, dynamic>{
  'sign': instance.sign,
  'tone': instance.tone,
  'prediction': instance.prediction,
  'date': instance.date,
  'luckyNumbers': instance.luckyNumbers,
  'luckyColor': instance.luckyColor,
  'advice': instance.advice,
};
