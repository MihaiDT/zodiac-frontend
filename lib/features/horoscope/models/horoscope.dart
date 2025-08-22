import 'package:freezed_annotation/freezed_annotation.dart';

part 'horoscope.freezed.dart';
part 'horoscope.g.dart';

@freezed
class HoroscopeResponse with _$HoroscopeResponse {
  const factory HoroscopeResponse({
    required String sign,
    required String tone,
    required String prediction,
    required String date,
    required List<String> luckyNumbers,
    required String luckyColor,
    String? advice,
  }) = _HoroscopeResponse;

  factory HoroscopeResponse.fromJson(Map<String, dynamic> json) =>
      _$HoroscopeResponseFromJson(json);
}

enum HoroscopeTone {
  @JsonValue('serious')
  serious,
  @JsonValue('funny')
  funny,
  @JsonValue('sincere')
  sincere,
}
