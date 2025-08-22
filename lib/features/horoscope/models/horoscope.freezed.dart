// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'horoscope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HoroscopeResponse _$HoroscopeResponseFromJson(Map<String, dynamic> json) {
  return _HoroscopeResponse.fromJson(json);
}

/// @nodoc
mixin _$HoroscopeResponse {
  String get sign => throw _privateConstructorUsedError;
  String get tone => throw _privateConstructorUsedError;
  String get prediction => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  List<String> get luckyNumbers => throw _privateConstructorUsedError;
  String get luckyColor => throw _privateConstructorUsedError;
  String? get advice => throw _privateConstructorUsedError;

  /// Serializes this HoroscopeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HoroscopeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HoroscopeResponseCopyWith<HoroscopeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoroscopeResponseCopyWith<$Res> {
  factory $HoroscopeResponseCopyWith(
    HoroscopeResponse value,
    $Res Function(HoroscopeResponse) then,
  ) = _$HoroscopeResponseCopyWithImpl<$Res, HoroscopeResponse>;
  @useResult
  $Res call({
    String sign,
    String tone,
    String prediction,
    String date,
    List<String> luckyNumbers,
    String luckyColor,
    String? advice,
  });
}

/// @nodoc
class _$HoroscopeResponseCopyWithImpl<$Res, $Val extends HoroscopeResponse>
    implements $HoroscopeResponseCopyWith<$Res> {
  _$HoroscopeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HoroscopeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sign = null,
    Object? tone = null,
    Object? prediction = null,
    Object? date = null,
    Object? luckyNumbers = null,
    Object? luckyColor = null,
    Object? advice = freezed,
  }) {
    return _then(
      _value.copyWith(
            sign:
                null == sign
                    ? _value.sign
                    : sign // ignore: cast_nullable_to_non_nullable
                        as String,
            tone:
                null == tone
                    ? _value.tone
                    : tone // ignore: cast_nullable_to_non_nullable
                        as String,
            prediction:
                null == prediction
                    ? _value.prediction
                    : prediction // ignore: cast_nullable_to_non_nullable
                        as String,
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as String,
            luckyNumbers:
                null == luckyNumbers
                    ? _value.luckyNumbers
                    : luckyNumbers // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            luckyColor:
                null == luckyColor
                    ? _value.luckyColor
                    : luckyColor // ignore: cast_nullable_to_non_nullable
                        as String,
            advice:
                freezed == advice
                    ? _value.advice
                    : advice // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HoroscopeResponseImplCopyWith<$Res>
    implements $HoroscopeResponseCopyWith<$Res> {
  factory _$$HoroscopeResponseImplCopyWith(
    _$HoroscopeResponseImpl value,
    $Res Function(_$HoroscopeResponseImpl) then,
  ) = __$$HoroscopeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sign,
    String tone,
    String prediction,
    String date,
    List<String> luckyNumbers,
    String luckyColor,
    String? advice,
  });
}

/// @nodoc
class __$$HoroscopeResponseImplCopyWithImpl<$Res>
    extends _$HoroscopeResponseCopyWithImpl<$Res, _$HoroscopeResponseImpl>
    implements _$$HoroscopeResponseImplCopyWith<$Res> {
  __$$HoroscopeResponseImplCopyWithImpl(
    _$HoroscopeResponseImpl _value,
    $Res Function(_$HoroscopeResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HoroscopeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sign = null,
    Object? tone = null,
    Object? prediction = null,
    Object? date = null,
    Object? luckyNumbers = null,
    Object? luckyColor = null,
    Object? advice = freezed,
  }) {
    return _then(
      _$HoroscopeResponseImpl(
        sign:
            null == sign
                ? _value.sign
                : sign // ignore: cast_nullable_to_non_nullable
                    as String,
        tone:
            null == tone
                ? _value.tone
                : tone // ignore: cast_nullable_to_non_nullable
                    as String,
        prediction:
            null == prediction
                ? _value.prediction
                : prediction // ignore: cast_nullable_to_non_nullable
                    as String,
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as String,
        luckyNumbers:
            null == luckyNumbers
                ? _value._luckyNumbers
                : luckyNumbers // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        luckyColor:
            null == luckyColor
                ? _value.luckyColor
                : luckyColor // ignore: cast_nullable_to_non_nullable
                    as String,
        advice:
            freezed == advice
                ? _value.advice
                : advice // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HoroscopeResponseImpl implements _HoroscopeResponse {
  const _$HoroscopeResponseImpl({
    required this.sign,
    required this.tone,
    required this.prediction,
    required this.date,
    required final List<String> luckyNumbers,
    required this.luckyColor,
    this.advice,
  }) : _luckyNumbers = luckyNumbers;

  factory _$HoroscopeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HoroscopeResponseImplFromJson(json);

  @override
  final String sign;
  @override
  final String tone;
  @override
  final String prediction;
  @override
  final String date;
  final List<String> _luckyNumbers;
  @override
  List<String> get luckyNumbers {
    if (_luckyNumbers is EqualUnmodifiableListView) return _luckyNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_luckyNumbers);
  }

  @override
  final String luckyColor;
  @override
  final String? advice;

  @override
  String toString() {
    return 'HoroscopeResponse(sign: $sign, tone: $tone, prediction: $prediction, date: $date, luckyNumbers: $luckyNumbers, luckyColor: $luckyColor, advice: $advice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoroscopeResponseImpl &&
            (identical(other.sign, sign) || other.sign == sign) &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(
              other._luckyNumbers,
              _luckyNumbers,
            ) &&
            (identical(other.luckyColor, luckyColor) ||
                other.luckyColor == luckyColor) &&
            (identical(other.advice, advice) || other.advice == advice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sign,
    tone,
    prediction,
    date,
    const DeepCollectionEquality().hash(_luckyNumbers),
    luckyColor,
    advice,
  );

  /// Create a copy of HoroscopeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HoroscopeResponseImplCopyWith<_$HoroscopeResponseImpl> get copyWith =>
      __$$HoroscopeResponseImplCopyWithImpl<_$HoroscopeResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HoroscopeResponseImplToJson(this);
  }
}

abstract class _HoroscopeResponse implements HoroscopeResponse {
  const factory _HoroscopeResponse({
    required final String sign,
    required final String tone,
    required final String prediction,
    required final String date,
    required final List<String> luckyNumbers,
    required final String luckyColor,
    final String? advice,
  }) = _$HoroscopeResponseImpl;

  factory _HoroscopeResponse.fromJson(Map<String, dynamic> json) =
      _$HoroscopeResponseImpl.fromJson;

  @override
  String get sign;
  @override
  String get tone;
  @override
  String get prediction;
  @override
  String get date;
  @override
  List<String> get luckyNumbers;
  @override
  String get luckyColor;
  @override
  String? get advice;

  /// Create a copy of HoroscopeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HoroscopeResponseImplCopyWith<_$HoroscopeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
