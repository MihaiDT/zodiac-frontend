import 'package:freezed_annotation/freezed_annotation.dart';

part 'zodiac_sign.freezed.dart';
part 'zodiac_sign.g.dart';

@freezed
class Personality with _$Personality {
  const factory Personality({
    @Default([]) List<String> strengths,
    @Default([]) List<String> weaknesses,
    @Default('') String description,
  }) = _Personality;

  factory Personality.fromJson(Map<String, dynamic> json) =>
      _$PersonalityFromJson(json);
}

@freezed
class ZodiacSign with _$ZodiacSign {
  const factory ZodiacSign({
    required String name,
    required String symbol,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    required String element,
    required String quality,
    @JsonKey(name: 'ruling_planet') required String rulingPlanet,
    String? image,
    @Default('') String description,
    @Default([]) List<String> traits,
    @Default('') String compatibility,
    Personality? personality,
  }) = _ZodiacSign;

  factory ZodiacSign.fromJson(Map<String, dynamic> json) =>
      _$ZodiacSignFromJson(json);
}
