// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'numerology.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NumerologyRequest _$NumerologyRequestFromJson(Map<String, dynamic> json) {
  return _NumerologyRequest.fromJson(json);
}

/// @nodoc
mixin _$NumerologyRequest {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get birthdate => throw _privateConstructorUsedError;

  /// Serializes this NumerologyRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NumerologyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumerologyRequestCopyWith<NumerologyRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumerologyRequestCopyWith<$Res> {
  factory $NumerologyRequestCopyWith(
    NumerologyRequest value,
    $Res Function(NumerologyRequest) then,
  ) = _$NumerologyRequestCopyWithImpl<$Res, NumerologyRequest>;
  @useResult
  $Res call({String firstName, String lastName, String birthdate});
}

/// @nodoc
class _$NumerologyRequestCopyWithImpl<$Res, $Val extends NumerologyRequest>
    implements $NumerologyRequestCopyWith<$Res> {
  _$NumerologyRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumerologyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? birthdate = null,
  }) {
    return _then(
      _value.copyWith(
            firstName:
                null == firstName
                    ? _value.firstName
                    : firstName // ignore: cast_nullable_to_non_nullable
                        as String,
            lastName:
                null == lastName
                    ? _value.lastName
                    : lastName // ignore: cast_nullable_to_non_nullable
                        as String,
            birthdate:
                null == birthdate
                    ? _value.birthdate
                    : birthdate // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NumerologyRequestImplCopyWith<$Res>
    implements $NumerologyRequestCopyWith<$Res> {
  factory _$$NumerologyRequestImplCopyWith(
    _$NumerologyRequestImpl value,
    $Res Function(_$NumerologyRequestImpl) then,
  ) = __$$NumerologyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String lastName, String birthdate});
}

/// @nodoc
class __$$NumerologyRequestImplCopyWithImpl<$Res>
    extends _$NumerologyRequestCopyWithImpl<$Res, _$NumerologyRequestImpl>
    implements _$$NumerologyRequestImplCopyWith<$Res> {
  __$$NumerologyRequestImplCopyWithImpl(
    _$NumerologyRequestImpl _value,
    $Res Function(_$NumerologyRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NumerologyRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? birthdate = null,
  }) {
    return _then(
      _$NumerologyRequestImpl(
        firstName:
            null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                    as String,
        lastName:
            null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                    as String,
        birthdate:
            null == birthdate
                ? _value.birthdate
                : birthdate // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NumerologyRequestImpl implements _NumerologyRequest {
  const _$NumerologyRequestImpl({
    required this.firstName,
    required this.lastName,
    required this.birthdate,
  });

  factory _$NumerologyRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$NumerologyRequestImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String birthdate;

  @override
  String toString() {
    return 'NumerologyRequest(firstName: $firstName, lastName: $lastName, birthdate: $birthdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumerologyRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, birthdate);

  /// Create a copy of NumerologyRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumerologyRequestImplCopyWith<_$NumerologyRequestImpl> get copyWith =>
      __$$NumerologyRequestImplCopyWithImpl<_$NumerologyRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NumerologyRequestImplToJson(this);
  }
}

abstract class _NumerologyRequest implements NumerologyRequest {
  const factory _NumerologyRequest({
    required final String firstName,
    required final String lastName,
    required final String birthdate,
  }) = _$NumerologyRequestImpl;

  factory _NumerologyRequest.fromJson(Map<String, dynamic> json) =
      _$NumerologyRequestImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get birthdate;

  /// Create a copy of NumerologyRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumerologyRequestImplCopyWith<_$NumerologyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KeyFiguresResponse _$KeyFiguresResponseFromJson(Map<String, dynamic> json) {
  return _KeyFiguresResponse.fromJson(json);
}

/// @nodoc
mixin _$KeyFiguresResponse {
  int get lifePathNumber => throw _privateConstructorUsedError;
  int get expressionNumber => throw _privateConstructorUsedError;
  int get soulUrgeNumber => throw _privateConstructorUsedError;
  int get personalityNumber => throw _privateConstructorUsedError;
  int get birthdayNumber => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get birthdate => throw _privateConstructorUsedError;

  /// Serializes this KeyFiguresResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KeyFiguresResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KeyFiguresResponseCopyWith<KeyFiguresResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyFiguresResponseCopyWith<$Res> {
  factory $KeyFiguresResponseCopyWith(
    KeyFiguresResponse value,
    $Res Function(KeyFiguresResponse) then,
  ) = _$KeyFiguresResponseCopyWithImpl<$Res, KeyFiguresResponse>;
  @useResult
  $Res call({
    int lifePathNumber,
    int expressionNumber,
    int soulUrgeNumber,
    int personalityNumber,
    int birthdayNumber,
    String name,
    String birthdate,
  });
}

/// @nodoc
class _$KeyFiguresResponseCopyWithImpl<$Res, $Val extends KeyFiguresResponse>
    implements $KeyFiguresResponseCopyWith<$Res> {
  _$KeyFiguresResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KeyFiguresResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lifePathNumber = null,
    Object? expressionNumber = null,
    Object? soulUrgeNumber = null,
    Object? personalityNumber = null,
    Object? birthdayNumber = null,
    Object? name = null,
    Object? birthdate = null,
  }) {
    return _then(
      _value.copyWith(
            lifePathNumber:
                null == lifePathNumber
                    ? _value.lifePathNumber
                    : lifePathNumber // ignore: cast_nullable_to_non_nullable
                        as int,
            expressionNumber:
                null == expressionNumber
                    ? _value.expressionNumber
                    : expressionNumber // ignore: cast_nullable_to_non_nullable
                        as int,
            soulUrgeNumber:
                null == soulUrgeNumber
                    ? _value.soulUrgeNumber
                    : soulUrgeNumber // ignore: cast_nullable_to_non_nullable
                        as int,
            personalityNumber:
                null == personalityNumber
                    ? _value.personalityNumber
                    : personalityNumber // ignore: cast_nullable_to_non_nullable
                        as int,
            birthdayNumber:
                null == birthdayNumber
                    ? _value.birthdayNumber
                    : birthdayNumber // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            birthdate:
                null == birthdate
                    ? _value.birthdate
                    : birthdate // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KeyFiguresResponseImplCopyWith<$Res>
    implements $KeyFiguresResponseCopyWith<$Res> {
  factory _$$KeyFiguresResponseImplCopyWith(
    _$KeyFiguresResponseImpl value,
    $Res Function(_$KeyFiguresResponseImpl) then,
  ) = __$$KeyFiguresResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int lifePathNumber,
    int expressionNumber,
    int soulUrgeNumber,
    int personalityNumber,
    int birthdayNumber,
    String name,
    String birthdate,
  });
}

/// @nodoc
class __$$KeyFiguresResponseImplCopyWithImpl<$Res>
    extends _$KeyFiguresResponseCopyWithImpl<$Res, _$KeyFiguresResponseImpl>
    implements _$$KeyFiguresResponseImplCopyWith<$Res> {
  __$$KeyFiguresResponseImplCopyWithImpl(
    _$KeyFiguresResponseImpl _value,
    $Res Function(_$KeyFiguresResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KeyFiguresResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lifePathNumber = null,
    Object? expressionNumber = null,
    Object? soulUrgeNumber = null,
    Object? personalityNumber = null,
    Object? birthdayNumber = null,
    Object? name = null,
    Object? birthdate = null,
  }) {
    return _then(
      _$KeyFiguresResponseImpl(
        lifePathNumber:
            null == lifePathNumber
                ? _value.lifePathNumber
                : lifePathNumber // ignore: cast_nullable_to_non_nullable
                    as int,
        expressionNumber:
            null == expressionNumber
                ? _value.expressionNumber
                : expressionNumber // ignore: cast_nullable_to_non_nullable
                    as int,
        soulUrgeNumber:
            null == soulUrgeNumber
                ? _value.soulUrgeNumber
                : soulUrgeNumber // ignore: cast_nullable_to_non_nullable
                    as int,
        personalityNumber:
            null == personalityNumber
                ? _value.personalityNumber
                : personalityNumber // ignore: cast_nullable_to_non_nullable
                    as int,
        birthdayNumber:
            null == birthdayNumber
                ? _value.birthdayNumber
                : birthdayNumber // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        birthdate:
            null == birthdate
                ? _value.birthdate
                : birthdate // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KeyFiguresResponseImpl implements _KeyFiguresResponse {
  const _$KeyFiguresResponseImpl({
    required this.lifePathNumber,
    required this.expressionNumber,
    required this.soulUrgeNumber,
    required this.personalityNumber,
    required this.birthdayNumber,
    required this.name,
    required this.birthdate,
  });

  factory _$KeyFiguresResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeyFiguresResponseImplFromJson(json);

  @override
  final int lifePathNumber;
  @override
  final int expressionNumber;
  @override
  final int soulUrgeNumber;
  @override
  final int personalityNumber;
  @override
  final int birthdayNumber;
  @override
  final String name;
  @override
  final String birthdate;

  @override
  String toString() {
    return 'KeyFiguresResponse(lifePathNumber: $lifePathNumber, expressionNumber: $expressionNumber, soulUrgeNumber: $soulUrgeNumber, personalityNumber: $personalityNumber, birthdayNumber: $birthdayNumber, name: $name, birthdate: $birthdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyFiguresResponseImpl &&
            (identical(other.lifePathNumber, lifePathNumber) ||
                other.lifePathNumber == lifePathNumber) &&
            (identical(other.expressionNumber, expressionNumber) ||
                other.expressionNumber == expressionNumber) &&
            (identical(other.soulUrgeNumber, soulUrgeNumber) ||
                other.soulUrgeNumber == soulUrgeNumber) &&
            (identical(other.personalityNumber, personalityNumber) ||
                other.personalityNumber == personalityNumber) &&
            (identical(other.birthdayNumber, birthdayNumber) ||
                other.birthdayNumber == birthdayNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    lifePathNumber,
    expressionNumber,
    soulUrgeNumber,
    personalityNumber,
    birthdayNumber,
    name,
    birthdate,
  );

  /// Create a copy of KeyFiguresResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeyFiguresResponseImplCopyWith<_$KeyFiguresResponseImpl> get copyWith =>
      __$$KeyFiguresResponseImplCopyWithImpl<_$KeyFiguresResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$KeyFiguresResponseImplToJson(this);
  }
}

abstract class _KeyFiguresResponse implements KeyFiguresResponse {
  const factory _KeyFiguresResponse({
    required final int lifePathNumber,
    required final int expressionNumber,
    required final int soulUrgeNumber,
    required final int personalityNumber,
    required final int birthdayNumber,
    required final String name,
    required final String birthdate,
  }) = _$KeyFiguresResponseImpl;

  factory _KeyFiguresResponse.fromJson(Map<String, dynamic> json) =
      _$KeyFiguresResponseImpl.fromJson;

  @override
  int get lifePathNumber;
  @override
  int get expressionNumber;
  @override
  int get soulUrgeNumber;
  @override
  int get personalityNumber;
  @override
  int get birthdayNumber;
  @override
  String get name;
  @override
  String get birthdate;

  /// Create a copy of KeyFiguresResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeyFiguresResponseImplCopyWith<_$KeyFiguresResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InterpretationsResponse _$InterpretationsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _InterpretationsResponse.fromJson(json);
}

/// @nodoc
mixin _$InterpretationsResponse {
  Map<String, String> get interpretations => throw _privateConstructorUsedError;
  String get overallReading => throw _privateConstructorUsedError;
  List<String> get strengths => throw _privateConstructorUsedError;
  List<String> get challenges => throw _privateConstructorUsedError;
  String get advice => throw _privateConstructorUsedError;

  /// Serializes this InterpretationsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InterpretationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterpretationsResponseCopyWith<InterpretationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterpretationsResponseCopyWith<$Res> {
  factory $InterpretationsResponseCopyWith(
    InterpretationsResponse value,
    $Res Function(InterpretationsResponse) then,
  ) = _$InterpretationsResponseCopyWithImpl<$Res, InterpretationsResponse>;
  @useResult
  $Res call({
    Map<String, String> interpretations,
    String overallReading,
    List<String> strengths,
    List<String> challenges,
    String advice,
  });
}

/// @nodoc
class _$InterpretationsResponseCopyWithImpl<
  $Res,
  $Val extends InterpretationsResponse
>
    implements $InterpretationsResponseCopyWith<$Res> {
  _$InterpretationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InterpretationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interpretations = null,
    Object? overallReading = null,
    Object? strengths = null,
    Object? challenges = null,
    Object? advice = null,
  }) {
    return _then(
      _value.copyWith(
            interpretations:
                null == interpretations
                    ? _value.interpretations
                    : interpretations // ignore: cast_nullable_to_non_nullable
                        as Map<String, String>,
            overallReading:
                null == overallReading
                    ? _value.overallReading
                    : overallReading // ignore: cast_nullable_to_non_nullable
                        as String,
            strengths:
                null == strengths
                    ? _value.strengths
                    : strengths // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            challenges:
                null == challenges
                    ? _value.challenges
                    : challenges // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            advice:
                null == advice
                    ? _value.advice
                    : advice // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InterpretationsResponseImplCopyWith<$Res>
    implements $InterpretationsResponseCopyWith<$Res> {
  factory _$$InterpretationsResponseImplCopyWith(
    _$InterpretationsResponseImpl value,
    $Res Function(_$InterpretationsResponseImpl) then,
  ) = __$$InterpretationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, String> interpretations,
    String overallReading,
    List<String> strengths,
    List<String> challenges,
    String advice,
  });
}

/// @nodoc
class __$$InterpretationsResponseImplCopyWithImpl<$Res>
    extends
        _$InterpretationsResponseCopyWithImpl<
          $Res,
          _$InterpretationsResponseImpl
        >
    implements _$$InterpretationsResponseImplCopyWith<$Res> {
  __$$InterpretationsResponseImplCopyWithImpl(
    _$InterpretationsResponseImpl _value,
    $Res Function(_$InterpretationsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InterpretationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interpretations = null,
    Object? overallReading = null,
    Object? strengths = null,
    Object? challenges = null,
    Object? advice = null,
  }) {
    return _then(
      _$InterpretationsResponseImpl(
        interpretations:
            null == interpretations
                ? _value._interpretations
                : interpretations // ignore: cast_nullable_to_non_nullable
                    as Map<String, String>,
        overallReading:
            null == overallReading
                ? _value.overallReading
                : overallReading // ignore: cast_nullable_to_non_nullable
                    as String,
        strengths:
            null == strengths
                ? _value._strengths
                : strengths // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        challenges:
            null == challenges
                ? _value._challenges
                : challenges // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        advice:
            null == advice
                ? _value.advice
                : advice // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InterpretationsResponseImpl implements _InterpretationsResponse {
  const _$InterpretationsResponseImpl({
    required final Map<String, String> interpretations,
    required this.overallReading,
    required final List<String> strengths,
    required final List<String> challenges,
    required this.advice,
  }) : _interpretations = interpretations,
       _strengths = strengths,
       _challenges = challenges;

  factory _$InterpretationsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterpretationsResponseImplFromJson(json);

  final Map<String, String> _interpretations;
  @override
  Map<String, String> get interpretations {
    if (_interpretations is EqualUnmodifiableMapView) return _interpretations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_interpretations);
  }

  @override
  final String overallReading;
  final List<String> _strengths;
  @override
  List<String> get strengths {
    if (_strengths is EqualUnmodifiableListView) return _strengths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strengths);
  }

  final List<String> _challenges;
  @override
  List<String> get challenges {
    if (_challenges is EqualUnmodifiableListView) return _challenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challenges);
  }

  @override
  final String advice;

  @override
  String toString() {
    return 'InterpretationsResponse(interpretations: $interpretations, overallReading: $overallReading, strengths: $strengths, challenges: $challenges, advice: $advice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterpretationsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._interpretations,
              _interpretations,
            ) &&
            (identical(other.overallReading, overallReading) ||
                other.overallReading == overallReading) &&
            const DeepCollectionEquality().equals(
              other._strengths,
              _strengths,
            ) &&
            const DeepCollectionEquality().equals(
              other._challenges,
              _challenges,
            ) &&
            (identical(other.advice, advice) || other.advice == advice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_interpretations),
    overallReading,
    const DeepCollectionEquality().hash(_strengths),
    const DeepCollectionEquality().hash(_challenges),
    advice,
  );

  /// Create a copy of InterpretationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterpretationsResponseImplCopyWith<_$InterpretationsResponseImpl>
  get copyWith => __$$InterpretationsResponseImplCopyWithImpl<
    _$InterpretationsResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterpretationsResponseImplToJson(this);
  }
}

abstract class _InterpretationsResponse implements InterpretationsResponse {
  const factory _InterpretationsResponse({
    required final Map<String, String> interpretations,
    required final String overallReading,
    required final List<String> strengths,
    required final List<String> challenges,
    required final String advice,
  }) = _$InterpretationsResponseImpl;

  factory _InterpretationsResponse.fromJson(Map<String, dynamic> json) =
      _$InterpretationsResponseImpl.fromJson;

  @override
  Map<String, String> get interpretations;
  @override
  String get overallReading;
  @override
  List<String> get strengths;
  @override
  List<String> get challenges;
  @override
  String get advice;

  /// Create a copy of InterpretationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterpretationsResponseImplCopyWith<_$InterpretationsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
