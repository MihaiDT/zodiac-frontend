// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zodiac_sign.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Personality _$PersonalityFromJson(Map<String, dynamic> json) {
  return _Personality.fromJson(json);
}

/// @nodoc
mixin _$Personality {
  List<String> get strengths => throw _privateConstructorUsedError;
  List<String> get weaknesses => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Personality to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Personality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalityCopyWith<Personality> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalityCopyWith<$Res> {
  factory $PersonalityCopyWith(
    Personality value,
    $Res Function(Personality) then,
  ) = _$PersonalityCopyWithImpl<$Res, Personality>;
  @useResult
  $Res call({
    List<String> strengths,
    List<String> weaknesses,
    String description,
  });
}

/// @nodoc
class _$PersonalityCopyWithImpl<$Res, $Val extends Personality>
    implements $PersonalityCopyWith<$Res> {
  _$PersonalityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Personality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strengths = null,
    Object? weaknesses = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            strengths:
                null == strengths
                    ? _value.strengths
                    : strengths // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            weaknesses:
                null == weaknesses
                    ? _value.weaknesses
                    : weaknesses // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PersonalityImplCopyWith<$Res>
    implements $PersonalityCopyWith<$Res> {
  factory _$$PersonalityImplCopyWith(
    _$PersonalityImpl value,
    $Res Function(_$PersonalityImpl) then,
  ) = __$$PersonalityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> strengths,
    List<String> weaknesses,
    String description,
  });
}

/// @nodoc
class __$$PersonalityImplCopyWithImpl<$Res>
    extends _$PersonalityCopyWithImpl<$Res, _$PersonalityImpl>
    implements _$$PersonalityImplCopyWith<$Res> {
  __$$PersonalityImplCopyWithImpl(
    _$PersonalityImpl _value,
    $Res Function(_$PersonalityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Personality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strengths = null,
    Object? weaknesses = null,
    Object? description = null,
  }) {
    return _then(
      _$PersonalityImpl(
        strengths:
            null == strengths
                ? _value._strengths
                : strengths // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        weaknesses:
            null == weaknesses
                ? _value._weaknesses
                : weaknesses // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalityImpl implements _Personality {
  const _$PersonalityImpl({
    final List<String> strengths = const [],
    final List<String> weaknesses = const [],
    this.description = '',
  }) : _strengths = strengths,
       _weaknesses = weaknesses;

  factory _$PersonalityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalityImplFromJson(json);

  final List<String> _strengths;
  @override
  @JsonKey()
  List<String> get strengths {
    if (_strengths is EqualUnmodifiableListView) return _strengths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strengths);
  }

  final List<String> _weaknesses;
  @override
  @JsonKey()
  List<String> get weaknesses {
    if (_weaknesses is EqualUnmodifiableListView) return _weaknesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weaknesses);
  }

  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'Personality(strengths: $strengths, weaknesses: $weaknesses, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalityImpl &&
            const DeepCollectionEquality().equals(
              other._strengths,
              _strengths,
            ) &&
            const DeepCollectionEquality().equals(
              other._weaknesses,
              _weaknesses,
            ) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_strengths),
    const DeepCollectionEquality().hash(_weaknesses),
    description,
  );

  /// Create a copy of Personality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalityImplCopyWith<_$PersonalityImpl> get copyWith =>
      __$$PersonalityImplCopyWithImpl<_$PersonalityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalityImplToJson(this);
  }
}

abstract class _Personality implements Personality {
  const factory _Personality({
    final List<String> strengths,
    final List<String> weaknesses,
    final String description,
  }) = _$PersonalityImpl;

  factory _Personality.fromJson(Map<String, dynamic> json) =
      _$PersonalityImpl.fromJson;

  @override
  List<String> get strengths;
  @override
  List<String> get weaknesses;
  @override
  String get description;

  /// Create a copy of Personality
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalityImplCopyWith<_$PersonalityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ZodiacSign _$ZodiacSignFromJson(Map<String, dynamic> json) {
  return _ZodiacSign.fromJson(json);
}

/// @nodoc
mixin _$ZodiacSign {
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String get endDate => throw _privateConstructorUsedError;
  String get element => throw _privateConstructorUsedError;
  String get quality => throw _privateConstructorUsedError;
  @JsonKey(name: 'ruling_planet')
  String get rulingPlanet => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get traits => throw _privateConstructorUsedError;
  String get compatibility => throw _privateConstructorUsedError;
  Personality? get personality => throw _privateConstructorUsedError;

  /// Serializes this ZodiacSign to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ZodiacSign
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ZodiacSignCopyWith<ZodiacSign> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZodiacSignCopyWith<$Res> {
  factory $ZodiacSignCopyWith(
    ZodiacSign value,
    $Res Function(ZodiacSign) then,
  ) = _$ZodiacSignCopyWithImpl<$Res, ZodiacSign>;
  @useResult
  $Res call({
    String name,
    String symbol,
    @JsonKey(name: 'start_date') String startDate,
    @JsonKey(name: 'end_date') String endDate,
    String element,
    String quality,
    @JsonKey(name: 'ruling_planet') String rulingPlanet,
    String? image,
    String description,
    List<String> traits,
    String compatibility,
    Personality? personality,
  });

  $PersonalityCopyWith<$Res>? get personality;
}

/// @nodoc
class _$ZodiacSignCopyWithImpl<$Res, $Val extends ZodiacSign>
    implements $ZodiacSignCopyWith<$Res> {
  _$ZodiacSignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ZodiacSign
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symbol = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? element = null,
    Object? quality = null,
    Object? rulingPlanet = null,
    Object? image = freezed,
    Object? description = null,
    Object? traits = null,
    Object? compatibility = null,
    Object? personality = freezed,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            symbol:
                null == symbol
                    ? _value.symbol
                    : symbol // ignore: cast_nullable_to_non_nullable
                        as String,
            startDate:
                null == startDate
                    ? _value.startDate
                    : startDate // ignore: cast_nullable_to_non_nullable
                        as String,
            endDate:
                null == endDate
                    ? _value.endDate
                    : endDate // ignore: cast_nullable_to_non_nullable
                        as String,
            element:
                null == element
                    ? _value.element
                    : element // ignore: cast_nullable_to_non_nullable
                        as String,
            quality:
                null == quality
                    ? _value.quality
                    : quality // ignore: cast_nullable_to_non_nullable
                        as String,
            rulingPlanet:
                null == rulingPlanet
                    ? _value.rulingPlanet
                    : rulingPlanet // ignore: cast_nullable_to_non_nullable
                        as String,
            image:
                freezed == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            traits:
                null == traits
                    ? _value.traits
                    : traits // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            compatibility:
                null == compatibility
                    ? _value.compatibility
                    : compatibility // ignore: cast_nullable_to_non_nullable
                        as String,
            personality:
                freezed == personality
                    ? _value.personality
                    : personality // ignore: cast_nullable_to_non_nullable
                        as Personality?,
          )
          as $Val,
    );
  }

  /// Create a copy of ZodiacSign
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonalityCopyWith<$Res>? get personality {
    if (_value.personality == null) {
      return null;
    }

    return $PersonalityCopyWith<$Res>(_value.personality!, (value) {
      return _then(_value.copyWith(personality: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ZodiacSignImplCopyWith<$Res>
    implements $ZodiacSignCopyWith<$Res> {
  factory _$$ZodiacSignImplCopyWith(
    _$ZodiacSignImpl value,
    $Res Function(_$ZodiacSignImpl) then,
  ) = __$$ZodiacSignImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String symbol,
    @JsonKey(name: 'start_date') String startDate,
    @JsonKey(name: 'end_date') String endDate,
    String element,
    String quality,
    @JsonKey(name: 'ruling_planet') String rulingPlanet,
    String? image,
    String description,
    List<String> traits,
    String compatibility,
    Personality? personality,
  });

  @override
  $PersonalityCopyWith<$Res>? get personality;
}

/// @nodoc
class __$$ZodiacSignImplCopyWithImpl<$Res>
    extends _$ZodiacSignCopyWithImpl<$Res, _$ZodiacSignImpl>
    implements _$$ZodiacSignImplCopyWith<$Res> {
  __$$ZodiacSignImplCopyWithImpl(
    _$ZodiacSignImpl _value,
    $Res Function(_$ZodiacSignImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ZodiacSign
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symbol = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? element = null,
    Object? quality = null,
    Object? rulingPlanet = null,
    Object? image = freezed,
    Object? description = null,
    Object? traits = null,
    Object? compatibility = null,
    Object? personality = freezed,
  }) {
    return _then(
      _$ZodiacSignImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        symbol:
            null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                    as String,
        startDate:
            null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                    as String,
        endDate:
            null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                    as String,
        element:
            null == element
                ? _value.element
                : element // ignore: cast_nullable_to_non_nullable
                    as String,
        quality:
            null == quality
                ? _value.quality
                : quality // ignore: cast_nullable_to_non_nullable
                    as String,
        rulingPlanet:
            null == rulingPlanet
                ? _value.rulingPlanet
                : rulingPlanet // ignore: cast_nullable_to_non_nullable
                    as String,
        image:
            freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        traits:
            null == traits
                ? _value._traits
                : traits // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        compatibility:
            null == compatibility
                ? _value.compatibility
                : compatibility // ignore: cast_nullable_to_non_nullable
                    as String,
        personality:
            freezed == personality
                ? _value.personality
                : personality // ignore: cast_nullable_to_non_nullable
                    as Personality?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ZodiacSignImpl implements _ZodiacSign {
  const _$ZodiacSignImpl({
    required this.name,
    required this.symbol,
    @JsonKey(name: 'start_date') required this.startDate,
    @JsonKey(name: 'end_date') required this.endDate,
    required this.element,
    required this.quality,
    @JsonKey(name: 'ruling_planet') required this.rulingPlanet,
    this.image,
    this.description = '',
    final List<String> traits = const [],
    this.compatibility = '',
    this.personality,
  }) : _traits = traits;

  factory _$ZodiacSignImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZodiacSignImplFromJson(json);

  @override
  final String name;
  @override
  final String symbol;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;
  @override
  final String element;
  @override
  final String quality;
  @override
  @JsonKey(name: 'ruling_planet')
  final String rulingPlanet;
  @override
  final String? image;
  @override
  @JsonKey()
  final String description;
  final List<String> _traits;
  @override
  @JsonKey()
  List<String> get traits {
    if (_traits is EqualUnmodifiableListView) return _traits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_traits);
  }

  @override
  @JsonKey()
  final String compatibility;
  @override
  final Personality? personality;

  @override
  String toString() {
    return 'ZodiacSign(name: $name, symbol: $symbol, startDate: $startDate, endDate: $endDate, element: $element, quality: $quality, rulingPlanet: $rulingPlanet, image: $image, description: $description, traits: $traits, compatibility: $compatibility, personality: $personality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZodiacSignImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.element, element) || other.element == element) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.rulingPlanet, rulingPlanet) ||
                other.rulingPlanet == rulingPlanet) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._traits, _traits) &&
            (identical(other.compatibility, compatibility) ||
                other.compatibility == compatibility) &&
            (identical(other.personality, personality) ||
                other.personality == personality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    symbol,
    startDate,
    endDate,
    element,
    quality,
    rulingPlanet,
    image,
    description,
    const DeepCollectionEquality().hash(_traits),
    compatibility,
    personality,
  );

  /// Create a copy of ZodiacSign
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZodiacSignImplCopyWith<_$ZodiacSignImpl> get copyWith =>
      __$$ZodiacSignImplCopyWithImpl<_$ZodiacSignImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZodiacSignImplToJson(this);
  }
}

abstract class _ZodiacSign implements ZodiacSign {
  const factory _ZodiacSign({
    required final String name,
    required final String symbol,
    @JsonKey(name: 'start_date') required final String startDate,
    @JsonKey(name: 'end_date') required final String endDate,
    required final String element,
    required final String quality,
    @JsonKey(name: 'ruling_planet') required final String rulingPlanet,
    final String? image,
    final String description,
    final List<String> traits,
    final String compatibility,
    final Personality? personality,
  }) = _$ZodiacSignImpl;

  factory _ZodiacSign.fromJson(Map<String, dynamic> json) =
      _$ZodiacSignImpl.fromJson;

  @override
  String get name;
  @override
  String get symbol;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;
  @override
  String get element;
  @override
  String get quality;
  @override
  @JsonKey(name: 'ruling_planet')
  String get rulingPlanet;
  @override
  String? get image;
  @override
  String get description;
  @override
  List<String> get traits;
  @override
  String get compatibility;
  @override
  Personality? get personality;

  /// Create a copy of ZodiacSign
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZodiacSignImplCopyWith<_$ZodiacSignImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
