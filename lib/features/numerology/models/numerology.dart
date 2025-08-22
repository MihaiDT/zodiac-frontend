import 'package:freezed_annotation/freezed_annotation.dart';

part 'numerology.freezed.dart';
part 'numerology.g.dart';

@freezed
class NumerologyRequest with _$NumerologyRequest {
  const factory NumerologyRequest({
    required String firstName,
    required String lastName,
    required String birthdate, // YYYY-MM-DD format
  }) = _NumerologyRequest;

  factory NumerologyRequest.fromJson(Map<String, dynamic> json) =>
      _$NumerologyRequestFromJson(json);
}

@freezed
class KeyFiguresResponse with _$KeyFiguresResponse {
  const factory KeyFiguresResponse({
    required int lifePathNumber,
    required int expressionNumber,
    required int soulUrgeNumber,
    required int personalityNumber,
    required int birthdayNumber,
    required String name,
    required String birthdate,
  }) = _KeyFiguresResponse;

  factory KeyFiguresResponse.fromJson(Map<String, dynamic> json) =>
      _$KeyFiguresResponseFromJson(json);
}

@freezed
class InterpretationsResponse with _$InterpretationsResponse {
  const factory InterpretationsResponse({
    required Map<String, String> interpretations,
    required String overallReading,
    required List<String> strengths,
    required List<String> challenges,
    required String advice,
  }) = _InterpretationsResponse;

  factory InterpretationsResponse.fromJson(Map<String, dynamic> json) =>
      _$InterpretationsResponseFromJson(json);
}
