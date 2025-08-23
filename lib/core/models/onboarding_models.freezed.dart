// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BirthData _$BirthDataFromJson(Map<String, dynamic> json) {
  return _BirthData.fromJson(json);
}

/// @nodoc
mixin _$BirthData {
  DateTime get birthDate => throw _privateConstructorUsedError;
  String? get birthTime => throw _privateConstructorUsedError;
  String? get birthPlace => throw _privateConstructorUsedError;
  String? get zodiacSign => throw _privateConstructorUsedError;

  /// Serializes this BirthData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BirthData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BirthDataCopyWith<BirthData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BirthDataCopyWith<$Res> {
  factory $BirthDataCopyWith(BirthData value, $Res Function(BirthData) then) =
      _$BirthDataCopyWithImpl<$Res, BirthData>;
  @useResult
  $Res call({
    DateTime birthDate,
    String? birthTime,
    String? birthPlace,
    String? zodiacSign,
  });
}

/// @nodoc
class _$BirthDataCopyWithImpl<$Res, $Val extends BirthData>
    implements $BirthDataCopyWith<$Res> {
  _$BirthDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BirthData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthDate = null,
    Object? birthTime = freezed,
    Object? birthPlace = freezed,
    Object? zodiacSign = freezed,
  }) {
    return _then(
      _value.copyWith(
            birthDate:
                null == birthDate
                    ? _value.birthDate
                    : birthDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            birthTime:
                freezed == birthTime
                    ? _value.birthTime
                    : birthTime // ignore: cast_nullable_to_non_nullable
                        as String?,
            birthPlace:
                freezed == birthPlace
                    ? _value.birthPlace
                    : birthPlace // ignore: cast_nullable_to_non_nullable
                        as String?,
            zodiacSign:
                freezed == zodiacSign
                    ? _value.zodiacSign
                    : zodiacSign // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BirthDataImplCopyWith<$Res>
    implements $BirthDataCopyWith<$Res> {
  factory _$$BirthDataImplCopyWith(
    _$BirthDataImpl value,
    $Res Function(_$BirthDataImpl) then,
  ) = __$$BirthDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime birthDate,
    String? birthTime,
    String? birthPlace,
    String? zodiacSign,
  });
}

/// @nodoc
class __$$BirthDataImplCopyWithImpl<$Res>
    extends _$BirthDataCopyWithImpl<$Res, _$BirthDataImpl>
    implements _$$BirthDataImplCopyWith<$Res> {
  __$$BirthDataImplCopyWithImpl(
    _$BirthDataImpl _value,
    $Res Function(_$BirthDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BirthData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthDate = null,
    Object? birthTime = freezed,
    Object? birthPlace = freezed,
    Object? zodiacSign = freezed,
  }) {
    return _then(
      _$BirthDataImpl(
        birthDate:
            null == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        birthTime:
            freezed == birthTime
                ? _value.birthTime
                : birthTime // ignore: cast_nullable_to_non_nullable
                    as String?,
        birthPlace:
            freezed == birthPlace
                ? _value.birthPlace
                : birthPlace // ignore: cast_nullable_to_non_nullable
                    as String?,
        zodiacSign:
            freezed == zodiacSign
                ? _value.zodiacSign
                : zodiacSign // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BirthDataImpl implements _BirthData {
  const _$BirthDataImpl({
    required this.birthDate,
    this.birthTime,
    this.birthPlace,
    this.zodiacSign,
  });

  factory _$BirthDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BirthDataImplFromJson(json);

  @override
  final DateTime birthDate;
  @override
  final String? birthTime;
  @override
  final String? birthPlace;
  @override
  final String? zodiacSign;

  @override
  String toString() {
    return 'BirthData(birthDate: $birthDate, birthTime: $birthTime, birthPlace: $birthPlace, zodiacSign: $zodiacSign)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BirthDataImpl &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.birthTime, birthTime) ||
                other.birthTime == birthTime) &&
            (identical(other.birthPlace, birthPlace) ||
                other.birthPlace == birthPlace) &&
            (identical(other.zodiacSign, zodiacSign) ||
                other.zodiacSign == zodiacSign));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, birthDate, birthTime, birthPlace, zodiacSign);

  /// Create a copy of BirthData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BirthDataImplCopyWith<_$BirthDataImpl> get copyWith =>
      __$$BirthDataImplCopyWithImpl<_$BirthDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BirthDataImplToJson(this);
  }
}

abstract class _BirthData implements BirthData {
  const factory _BirthData({
    required final DateTime birthDate,
    final String? birthTime,
    final String? birthPlace,
    final String? zodiacSign,
  }) = _$BirthDataImpl;

  factory _BirthData.fromJson(Map<String, dynamic> json) =
      _$BirthDataImpl.fromJson;

  @override
  DateTime get birthDate;
  @override
  String? get birthTime;
  @override
  String? get birthPlace;
  @override
  String? get zodiacSign;

  /// Create a copy of BirthData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BirthDataImplCopyWith<_$BirthDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  String get tone => throw _privateConstructorUsedError;
  bool get dailyNotifications => throw _privateConstructorUsedError;
  bool get weeklyNotifications => throw _privateConstructorUsedError;
  bool get monthlyNotifications => throw _privateConstructorUsedError;
  bool get tarotNotifications => throw _privateConstructorUsedError;
  bool get numerologyNotifications => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  List<String> get selectedIntents => throw _privateConstructorUsedError;

  /// Serializes this UserPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
    UserPreferences value,
    $Res Function(UserPreferences) then,
  ) = _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call({
    String tone,
    bool dailyNotifications,
    bool weeklyNotifications,
    bool monthlyNotifications,
    bool tarotNotifications,
    bool numerologyNotifications,
    String timezone,
    List<String> selectedIntents,
  });
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tone = null,
    Object? dailyNotifications = null,
    Object? weeklyNotifications = null,
    Object? monthlyNotifications = null,
    Object? tarotNotifications = null,
    Object? numerologyNotifications = null,
    Object? timezone = null,
    Object? selectedIntents = null,
  }) {
    return _then(
      _value.copyWith(
            tone:
                null == tone
                    ? _value.tone
                    : tone // ignore: cast_nullable_to_non_nullable
                        as String,
            dailyNotifications:
                null == dailyNotifications
                    ? _value.dailyNotifications
                    : dailyNotifications // ignore: cast_nullable_to_non_nullable
                        as bool,
            weeklyNotifications:
                null == weeklyNotifications
                    ? _value.weeklyNotifications
                    : weeklyNotifications // ignore: cast_nullable_to_non_nullable
                        as bool,
            monthlyNotifications:
                null == monthlyNotifications
                    ? _value.monthlyNotifications
                    : monthlyNotifications // ignore: cast_nullable_to_non_nullable
                        as bool,
            tarotNotifications:
                null == tarotNotifications
                    ? _value.tarotNotifications
                    : tarotNotifications // ignore: cast_nullable_to_non_nullable
                        as bool,
            numerologyNotifications:
                null == numerologyNotifications
                    ? _value.numerologyNotifications
                    : numerologyNotifications // ignore: cast_nullable_to_non_nullable
                        as bool,
            timezone:
                null == timezone
                    ? _value.timezone
                    : timezone // ignore: cast_nullable_to_non_nullable
                        as String,
            selectedIntents:
                null == selectedIntents
                    ? _value.selectedIntents
                    : selectedIntents // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(
    _$UserPreferencesImpl value,
    $Res Function(_$UserPreferencesImpl) then,
  ) = __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String tone,
    bool dailyNotifications,
    bool weeklyNotifications,
    bool monthlyNotifications,
    bool tarotNotifications,
    bool numerologyNotifications,
    String timezone,
    List<String> selectedIntents,
  });
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
    _$UserPreferencesImpl _value,
    $Res Function(_$UserPreferencesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tone = null,
    Object? dailyNotifications = null,
    Object? weeklyNotifications = null,
    Object? monthlyNotifications = null,
    Object? tarotNotifications = null,
    Object? numerologyNotifications = null,
    Object? timezone = null,
    Object? selectedIntents = null,
  }) {
    return _then(
      _$UserPreferencesImpl(
        tone:
            null == tone
                ? _value.tone
                : tone // ignore: cast_nullable_to_non_nullable
                    as String,
        dailyNotifications:
            null == dailyNotifications
                ? _value.dailyNotifications
                : dailyNotifications // ignore: cast_nullable_to_non_nullable
                    as bool,
        weeklyNotifications:
            null == weeklyNotifications
                ? _value.weeklyNotifications
                : weeklyNotifications // ignore: cast_nullable_to_non_nullable
                    as bool,
        monthlyNotifications:
            null == monthlyNotifications
                ? _value.monthlyNotifications
                : monthlyNotifications // ignore: cast_nullable_to_non_nullable
                    as bool,
        tarotNotifications:
            null == tarotNotifications
                ? _value.tarotNotifications
                : tarotNotifications // ignore: cast_nullable_to_non_nullable
                    as bool,
        numerologyNotifications:
            null == numerologyNotifications
                ? _value.numerologyNotifications
                : numerologyNotifications // ignore: cast_nullable_to_non_nullable
                    as bool,
        timezone:
            null == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                    as String,
        selectedIntents:
            null == selectedIntents
                ? _value._selectedIntents
                : selectedIntents // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl({
    this.tone = 'balanced',
    this.dailyNotifications = true,
    this.weeklyNotifications = false,
    this.monthlyNotifications = false,
    this.tarotNotifications = false,
    this.numerologyNotifications = false,
    this.timezone = 'Europe/Bucharest',
    final List<String> selectedIntents = const [],
  }) : _selectedIntents = selectedIntents;

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  @override
  @JsonKey()
  final String tone;
  @override
  @JsonKey()
  final bool dailyNotifications;
  @override
  @JsonKey()
  final bool weeklyNotifications;
  @override
  @JsonKey()
  final bool monthlyNotifications;
  @override
  @JsonKey()
  final bool tarotNotifications;
  @override
  @JsonKey()
  final bool numerologyNotifications;
  @override
  @JsonKey()
  final String timezone;
  final List<String> _selectedIntents;
  @override
  @JsonKey()
  List<String> get selectedIntents {
    if (_selectedIntents is EqualUnmodifiableListView) return _selectedIntents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedIntents);
  }

  @override
  String toString() {
    return 'UserPreferences(tone: $tone, dailyNotifications: $dailyNotifications, weeklyNotifications: $weeklyNotifications, monthlyNotifications: $monthlyNotifications, tarotNotifications: $tarotNotifications, numerologyNotifications: $numerologyNotifications, timezone: $timezone, selectedIntents: $selectedIntents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.dailyNotifications, dailyNotifications) ||
                other.dailyNotifications == dailyNotifications) &&
            (identical(other.weeklyNotifications, weeklyNotifications) ||
                other.weeklyNotifications == weeklyNotifications) &&
            (identical(other.monthlyNotifications, monthlyNotifications) ||
                other.monthlyNotifications == monthlyNotifications) &&
            (identical(other.tarotNotifications, tarotNotifications) ||
                other.tarotNotifications == tarotNotifications) &&
            (identical(
                  other.numerologyNotifications,
                  numerologyNotifications,
                ) ||
                other.numerologyNotifications == numerologyNotifications) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            const DeepCollectionEquality().equals(
              other._selectedIntents,
              _selectedIntents,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tone,
    dailyNotifications,
    weeklyNotifications,
    monthlyNotifications,
    tarotNotifications,
    numerologyNotifications,
    timezone,
    const DeepCollectionEquality().hash(_selectedIntents),
  );

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(this);
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences({
    final String tone,
    final bool dailyNotifications,
    final bool weeklyNotifications,
    final bool monthlyNotifications,
    final bool tarotNotifications,
    final bool numerologyNotifications,
    final String timezone,
    final List<String> selectedIntents,
  }) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  String get tone;
  @override
  bool get dailyNotifications;
  @override
  bool get weeklyNotifications;
  @override
  bool get monthlyNotifications;
  @override
  bool get tarotNotifications;
  @override
  bool get numerologyNotifications;
  @override
  String get timezone;
  @override
  List<String> get selectedIntents;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OnboardingState _$OnboardingStateFromJson(Map<String, dynamic> json) {
  return _OnboardingState.fromJson(json);
}

/// @nodoc
mixin _$OnboardingState {
  BirthData? get birthData => throw _privateConstructorUsedError;
  UserPreferences? get preferences => throw _privateConstructorUsedError;
  int get currentStep => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this OnboardingState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
    OnboardingState value,
    $Res Function(OnboardingState) then,
  ) = _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call({
    BirthData? birthData,
    UserPreferences? preferences,
    int currentStep,
    bool isLoading,
    String? error,
  });

  $BirthDataCopyWith<$Res>? get birthData;
  $UserPreferencesCopyWith<$Res>? get preferences;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthData = freezed,
    Object? preferences = freezed,
    Object? currentStep = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            birthData:
                freezed == birthData
                    ? _value.birthData
                    : birthData // ignore: cast_nullable_to_non_nullable
                        as BirthData?,
            preferences:
                freezed == preferences
                    ? _value.preferences
                    : preferences // ignore: cast_nullable_to_non_nullable
                        as UserPreferences?,
            currentStep:
                null == currentStep
                    ? _value.currentStep
                    : currentStep // ignore: cast_nullable_to_non_nullable
                        as int,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BirthDataCopyWith<$Res>? get birthData {
    if (_value.birthData == null) {
      return null;
    }

    return $BirthDataCopyWith<$Res>(_value.birthData!, (value) {
      return _then(_value.copyWith(birthData: value) as $Val);
    });
  }

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesCopyWith<$Res>? get preferences {
    if (_value.preferences == null) {
      return null;
    }

    return $UserPreferencesCopyWith<$Res>(_value.preferences!, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(
    _$OnboardingStateImpl value,
    $Res Function(_$OnboardingStateImpl) then,
  ) = __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BirthData? birthData,
    UserPreferences? preferences,
    int currentStep,
    bool isLoading,
    String? error,
  });

  @override
  $BirthDataCopyWith<$Res>? get birthData;
  @override
  $UserPreferencesCopyWith<$Res>? get preferences;
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
    _$OnboardingStateImpl _value,
    $Res Function(_$OnboardingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthData = freezed,
    Object? preferences = freezed,
    Object? currentStep = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _$OnboardingStateImpl(
        birthData:
            freezed == birthData
                ? _value.birthData
                : birthData // ignore: cast_nullable_to_non_nullable
                    as BirthData?,
        preferences:
            freezed == preferences
                ? _value.preferences
                : preferences // ignore: cast_nullable_to_non_nullable
                    as UserPreferences?,
        currentStep:
            null == currentStep
                ? _value.currentStep
                : currentStep // ignore: cast_nullable_to_non_nullable
                    as int,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OnboardingStateImpl implements _OnboardingState {
  const _$OnboardingStateImpl({
    this.birthData,
    this.preferences,
    this.currentStep = 0,
    this.isLoading = false,
    this.error,
  });

  factory _$OnboardingStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnboardingStateImplFromJson(json);

  @override
  final BirthData? birthData;
  @override
  final UserPreferences? preferences;
  @override
  @JsonKey()
  final int currentStep;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'OnboardingState(birthData: $birthData, preferences: $preferences, currentStep: $currentStep, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.birthData, birthData) ||
                other.birthData == birthData) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    birthData,
    preferences,
    currentStep,
    isLoading,
    error,
  );

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OnboardingStateImplToJson(this);
  }
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState({
    final BirthData? birthData,
    final UserPreferences? preferences,
    final int currentStep,
    final bool isLoading,
    final String? error,
  }) = _$OnboardingStateImpl;

  factory _OnboardingState.fromJson(Map<String, dynamic> json) =
      _$OnboardingStateImpl.fromJson;

  @override
  BirthData? get birthData;
  @override
  UserPreferences? get preferences;
  @override
  int get currentStep;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ZodiacSign _$ZodiacSignFromJson(Map<String, dynamic> json) {
  return _ZodiacSign.fromJson(json);
}

/// @nodoc
mixin _$ZodiacSign {
  String get sign => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get dateRange => throw _privateConstructorUsedError;
  String get element => throw _privateConstructorUsedError;
  String get planet => throw _privateConstructorUsedError;

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
    String sign,
    String name,
    String description,
    String dateRange,
    String element,
    String planet,
  });
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
    Object? sign = null,
    Object? name = null,
    Object? description = null,
    Object? dateRange = null,
    Object? element = null,
    Object? planet = null,
  }) {
    return _then(
      _value.copyWith(
            sign:
                null == sign
                    ? _value.sign
                    : sign // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            dateRange:
                null == dateRange
                    ? _value.dateRange
                    : dateRange // ignore: cast_nullable_to_non_nullable
                        as String,
            element:
                null == element
                    ? _value.element
                    : element // ignore: cast_nullable_to_non_nullable
                        as String,
            planet:
                null == planet
                    ? _value.planet
                    : planet // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
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
    String sign,
    String name,
    String description,
    String dateRange,
    String element,
    String planet,
  });
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
    Object? sign = null,
    Object? name = null,
    Object? description = null,
    Object? dateRange = null,
    Object? element = null,
    Object? planet = null,
  }) {
    return _then(
      _$ZodiacSignImpl(
        sign:
            null == sign
                ? _value.sign
                : sign // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        dateRange:
            null == dateRange
                ? _value.dateRange
                : dateRange // ignore: cast_nullable_to_non_nullable
                    as String,
        element:
            null == element
                ? _value.element
                : element // ignore: cast_nullable_to_non_nullable
                    as String,
        planet:
            null == planet
                ? _value.planet
                : planet // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ZodiacSignImpl implements _ZodiacSign {
  const _$ZodiacSignImpl({
    required this.sign,
    required this.name,
    required this.description,
    required this.dateRange,
    required this.element,
    required this.planet,
  });

  factory _$ZodiacSignImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZodiacSignImplFromJson(json);

  @override
  final String sign;
  @override
  final String name;
  @override
  final String description;
  @override
  final String dateRange;
  @override
  final String element;
  @override
  final String planet;

  @override
  String toString() {
    return 'ZodiacSign(sign: $sign, name: $name, description: $description, dateRange: $dateRange, element: $element, planet: $planet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZodiacSignImpl &&
            (identical(other.sign, sign) || other.sign == sign) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            (identical(other.element, element) || other.element == element) &&
            (identical(other.planet, planet) || other.planet == planet));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sign,
    name,
    description,
    dateRange,
    element,
    planet,
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
    required final String sign,
    required final String name,
    required final String description,
    required final String dateRange,
    required final String element,
    required final String planet,
  }) = _$ZodiacSignImpl;

  factory _ZodiacSign.fromJson(Map<String, dynamic> json) =
      _$ZodiacSignImpl.fromJson;

  @override
  String get sign;
  @override
  String get name;
  @override
  String get description;
  @override
  String get dateRange;
  @override
  String get element;
  @override
  String get planet;

  /// Create a copy of ZodiacSign
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZodiacSignImplCopyWith<_$ZodiacSignImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HoroscopeTeaser _$HoroscopeTeaserFromJson(Map<String, dynamic> json) {
  return _HoroscopeTeaser.fromJson(json);
}

/// @nodoc
mixin _$HoroscopeTeaser {
  String get sign => throw _privateConstructorUsedError;
  String get tone => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  /// Serializes this HoroscopeTeaser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HoroscopeTeaser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HoroscopeTeaserCopyWith<HoroscopeTeaser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoroscopeTeaserCopyWith<$Res> {
  factory $HoroscopeTeaserCopyWith(
    HoroscopeTeaser value,
    $Res Function(HoroscopeTeaser) then,
  ) = _$HoroscopeTeaserCopyWithImpl<$Res, HoroscopeTeaser>;
  @useResult
  $Res call({String sign, String tone, String content, String date});
}

/// @nodoc
class _$HoroscopeTeaserCopyWithImpl<$Res, $Val extends HoroscopeTeaser>
    implements $HoroscopeTeaserCopyWith<$Res> {
  _$HoroscopeTeaserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HoroscopeTeaser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sign = null,
    Object? tone = null,
    Object? content = null,
    Object? date = null,
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
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HoroscopeTeaserImplCopyWith<$Res>
    implements $HoroscopeTeaserCopyWith<$Res> {
  factory _$$HoroscopeTeaserImplCopyWith(
    _$HoroscopeTeaserImpl value,
    $Res Function(_$HoroscopeTeaserImpl) then,
  ) = __$$HoroscopeTeaserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sign, String tone, String content, String date});
}

/// @nodoc
class __$$HoroscopeTeaserImplCopyWithImpl<$Res>
    extends _$HoroscopeTeaserCopyWithImpl<$Res, _$HoroscopeTeaserImpl>
    implements _$$HoroscopeTeaserImplCopyWith<$Res> {
  __$$HoroscopeTeaserImplCopyWithImpl(
    _$HoroscopeTeaserImpl _value,
    $Res Function(_$HoroscopeTeaserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HoroscopeTeaser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sign = null,
    Object? tone = null,
    Object? content = null,
    Object? date = null,
  }) {
    return _then(
      _$HoroscopeTeaserImpl(
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
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HoroscopeTeaserImpl implements _HoroscopeTeaser {
  const _$HoroscopeTeaserImpl({
    required this.sign,
    required this.tone,
    required this.content,
    required this.date,
  });

  factory _$HoroscopeTeaserImpl.fromJson(Map<String, dynamic> json) =>
      _$$HoroscopeTeaserImplFromJson(json);

  @override
  final String sign;
  @override
  final String tone;
  @override
  final String content;
  @override
  final String date;

  @override
  String toString() {
    return 'HoroscopeTeaser(sign: $sign, tone: $tone, content: $content, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoroscopeTeaserImpl &&
            (identical(other.sign, sign) || other.sign == sign) &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sign, tone, content, date);

  /// Create a copy of HoroscopeTeaser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HoroscopeTeaserImplCopyWith<_$HoroscopeTeaserImpl> get copyWith =>
      __$$HoroscopeTeaserImplCopyWithImpl<_$HoroscopeTeaserImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HoroscopeTeaserImplToJson(this);
  }
}

abstract class _HoroscopeTeaser implements HoroscopeTeaser {
  const factory _HoroscopeTeaser({
    required final String sign,
    required final String tone,
    required final String content,
    required final String date,
  }) = _$HoroscopeTeaserImpl;

  factory _HoroscopeTeaser.fromJson(Map<String, dynamic> json) =
      _$HoroscopeTeaserImpl.fromJson;

  @override
  String get sign;
  @override
  String get tone;
  @override
  String get content;
  @override
  String get date;

  /// Create a copy of HoroscopeTeaser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HoroscopeTeaserImplCopyWith<_$HoroscopeTeaserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) {
  return _RegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  ProfileData get profile => throw _privateConstructorUsedError;

  /// Serializes this RegisterRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestCopyWith<RegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestCopyWith<$Res> {
  factory $RegisterRequestCopyWith(
    RegisterRequest value,
    $Res Function(RegisterRequest) then,
  ) = _$RegisterRequestCopyWithImpl<$Res, RegisterRequest>;
  @useResult
  $Res call({
    String email,
    String password,
    String? firstName,
    String? lastName,
    ProfileData profile,
  });

  $ProfileDataCopyWith<$Res> get profile;
}

/// @nodoc
class _$RegisterRequestCopyWithImpl<$Res, $Val extends RegisterRequest>
    implements $RegisterRequestCopyWith<$Res> {
  _$RegisterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profile = null,
  }) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
            firstName:
                freezed == firstName
                    ? _value.firstName
                    : firstName // ignore: cast_nullable_to_non_nullable
                        as String?,
            lastName:
                freezed == lastName
                    ? _value.lastName
                    : lastName // ignore: cast_nullable_to_non_nullable
                        as String?,
            profile:
                null == profile
                    ? _value.profile
                    : profile // ignore: cast_nullable_to_non_nullable
                        as ProfileData,
          )
          as $Val,
    );
  }

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileDataCopyWith<$Res> get profile {
    return $ProfileDataCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterRequestImplCopyWith<$Res>
    implements $RegisterRequestCopyWith<$Res> {
  factory _$$RegisterRequestImplCopyWith(
    _$RegisterRequestImpl value,
    $Res Function(_$RegisterRequestImpl) then,
  ) = __$$RegisterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String password,
    String? firstName,
    String? lastName,
    ProfileData profile,
  });

  @override
  $ProfileDataCopyWith<$Res> get profile;
}

/// @nodoc
class __$$RegisterRequestImplCopyWithImpl<$Res>
    extends _$RegisterRequestCopyWithImpl<$Res, _$RegisterRequestImpl>
    implements _$$RegisterRequestImplCopyWith<$Res> {
  __$$RegisterRequestImplCopyWithImpl(
    _$RegisterRequestImpl _value,
    $Res Function(_$RegisterRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profile = null,
  }) {
    return _then(
      _$RegisterRequestImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
        firstName:
            freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                    as String?,
        lastName:
            freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                    as String?,
        profile:
            null == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                    as ProfileData,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterRequestImpl implements _RegisterRequest {
  const _$RegisterRequestImpl({
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
    required this.profile,
  });

  factory _$RegisterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final ProfileData profile;

  @override
  String toString() {
    return 'RegisterRequest(email: $email, password: $password, firstName: $firstName, lastName: $lastName, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, firstName, lastName, profile);

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      __$$RegisterRequestImplCopyWithImpl<_$RegisterRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterRequestImplToJson(this);
  }
}

abstract class _RegisterRequest implements RegisterRequest {
  const factory _RegisterRequest({
    required final String email,
    required final String password,
    final String? firstName,
    final String? lastName,
    required final ProfileData profile,
  }) = _$RegisterRequestImpl;

  factory _RegisterRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  ProfileData get profile;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return _ProfileData.fromJson(json);
}

/// @nodoc
mixin _$ProfileData {
  String get birthDate => throw _privateConstructorUsedError;
  String? get birthTime => throw _privateConstructorUsedError;
  String? get birthPlace => throw _privateConstructorUsedError;
  String? get zodiacSign => throw _privateConstructorUsedError;
  String? get tone => throw _privateConstructorUsedError;
  NotificationSettings? get notifications => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  List<String> get selectedIntents => throw _privateConstructorUsedError;

  /// Serializes this ProfileData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
    ProfileData value,
    $Res Function(ProfileData) then,
  ) = _$ProfileDataCopyWithImpl<$Res, ProfileData>;
  @useResult
  $Res call({
    String birthDate,
    String? birthTime,
    String? birthPlace,
    String? zodiacSign,
    String? tone,
    NotificationSettings? notifications,
    String? timezone,
    List<String> selectedIntents,
  });

  $NotificationSettingsCopyWith<$Res>? get notifications;
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res, $Val extends ProfileData>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthDate = null,
    Object? birthTime = freezed,
    Object? birthPlace = freezed,
    Object? zodiacSign = freezed,
    Object? tone = freezed,
    Object? notifications = freezed,
    Object? timezone = freezed,
    Object? selectedIntents = null,
  }) {
    return _then(
      _value.copyWith(
            birthDate:
                null == birthDate
                    ? _value.birthDate
                    : birthDate // ignore: cast_nullable_to_non_nullable
                        as String,
            birthTime:
                freezed == birthTime
                    ? _value.birthTime
                    : birthTime // ignore: cast_nullable_to_non_nullable
                        as String?,
            birthPlace:
                freezed == birthPlace
                    ? _value.birthPlace
                    : birthPlace // ignore: cast_nullable_to_non_nullable
                        as String?,
            zodiacSign:
                freezed == zodiacSign
                    ? _value.zodiacSign
                    : zodiacSign // ignore: cast_nullable_to_non_nullable
                        as String?,
            tone:
                freezed == tone
                    ? _value.tone
                    : tone // ignore: cast_nullable_to_non_nullable
                        as String?,
            notifications:
                freezed == notifications
                    ? _value.notifications
                    : notifications // ignore: cast_nullable_to_non_nullable
                        as NotificationSettings?,
            timezone:
                freezed == timezone
                    ? _value.timezone
                    : timezone // ignore: cast_nullable_to_non_nullable
                        as String?,
            selectedIntents:
                null == selectedIntents
                    ? _value.selectedIntents
                    : selectedIntents // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get notifications {
    if (_value.notifications == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.notifications!, (value) {
      return _then(_value.copyWith(notifications: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileDataImplCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$$ProfileDataImplCopyWith(
    _$ProfileDataImpl value,
    $Res Function(_$ProfileDataImpl) then,
  ) = __$$ProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String birthDate,
    String? birthTime,
    String? birthPlace,
    String? zodiacSign,
    String? tone,
    NotificationSettings? notifications,
    String? timezone,
    List<String> selectedIntents,
  });

  @override
  $NotificationSettingsCopyWith<$Res>? get notifications;
}

/// @nodoc
class __$$ProfileDataImplCopyWithImpl<$Res>
    extends _$ProfileDataCopyWithImpl<$Res, _$ProfileDataImpl>
    implements _$$ProfileDataImplCopyWith<$Res> {
  __$$ProfileDataImplCopyWithImpl(
    _$ProfileDataImpl _value,
    $Res Function(_$ProfileDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthDate = null,
    Object? birthTime = freezed,
    Object? birthPlace = freezed,
    Object? zodiacSign = freezed,
    Object? tone = freezed,
    Object? notifications = freezed,
    Object? timezone = freezed,
    Object? selectedIntents = null,
  }) {
    return _then(
      _$ProfileDataImpl(
        birthDate:
            null == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                    as String,
        birthTime:
            freezed == birthTime
                ? _value.birthTime
                : birthTime // ignore: cast_nullable_to_non_nullable
                    as String?,
        birthPlace:
            freezed == birthPlace
                ? _value.birthPlace
                : birthPlace // ignore: cast_nullable_to_non_nullable
                    as String?,
        zodiacSign:
            freezed == zodiacSign
                ? _value.zodiacSign
                : zodiacSign // ignore: cast_nullable_to_non_nullable
                    as String?,
        tone:
            freezed == tone
                ? _value.tone
                : tone // ignore: cast_nullable_to_non_nullable
                    as String?,
        notifications:
            freezed == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                    as NotificationSettings?,
        timezone:
            freezed == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                    as String?,
        selectedIntents:
            null == selectedIntents
                ? _value._selectedIntents
                : selectedIntents // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDataImpl implements _ProfileData {
  const _$ProfileDataImpl({
    required this.birthDate,
    this.birthTime,
    this.birthPlace,
    this.zodiacSign,
    this.tone,
    this.notifications,
    this.timezone,
    final List<String> selectedIntents = const [],
  }) : _selectedIntents = selectedIntents;

  factory _$ProfileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDataImplFromJson(json);

  @override
  final String birthDate;
  @override
  final String? birthTime;
  @override
  final String? birthPlace;
  @override
  final String? zodiacSign;
  @override
  final String? tone;
  @override
  final NotificationSettings? notifications;
  @override
  final String? timezone;
  final List<String> _selectedIntents;
  @override
  @JsonKey()
  List<String> get selectedIntents {
    if (_selectedIntents is EqualUnmodifiableListView) return _selectedIntents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedIntents);
  }

  @override
  String toString() {
    return 'ProfileData(birthDate: $birthDate, birthTime: $birthTime, birthPlace: $birthPlace, zodiacSign: $zodiacSign, tone: $tone, notifications: $notifications, timezone: $timezone, selectedIntents: $selectedIntents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataImpl &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.birthTime, birthTime) ||
                other.birthTime == birthTime) &&
            (identical(other.birthPlace, birthPlace) ||
                other.birthPlace == birthPlace) &&
            (identical(other.zodiacSign, zodiacSign) ||
                other.zodiacSign == zodiacSign) &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            const DeepCollectionEquality().equals(
              other._selectedIntents,
              _selectedIntents,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    birthDate,
    birthTime,
    birthPlace,
    zodiacSign,
    tone,
    notifications,
    timezone,
    const DeepCollectionEquality().hash(_selectedIntents),
  );

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      __$$ProfileDataImplCopyWithImpl<_$ProfileDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDataImplToJson(this);
  }
}

abstract class _ProfileData implements ProfileData {
  const factory _ProfileData({
    required final String birthDate,
    final String? birthTime,
    final String? birthPlace,
    final String? zodiacSign,
    final String? tone,
    final NotificationSettings? notifications,
    final String? timezone,
    final List<String> selectedIntents,
  }) = _$ProfileDataImpl;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$ProfileDataImpl.fromJson;

  @override
  String get birthDate;
  @override
  String? get birthTime;
  @override
  String? get birthPlace;
  @override
  String? get zodiacSign;
  @override
  String? get tone;
  @override
  NotificationSettings? get notifications;
  @override
  String? get timezone;
  @override
  List<String> get selectedIntents;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileUpdateRequest _$ProfileUpdateRequestFromJson(Map<String, dynamic> json) {
  return _ProfileUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$ProfileUpdateRequest {
  String get tone => throw _privateConstructorUsedError;
  NotificationSettings get notifications => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  String? get birthDate => throw _privateConstructorUsedError;
  String? get birthTime => throw _privateConstructorUsedError;
  String? get birthPlace => throw _privateConstructorUsedError;
  String? get zodiacSign => throw _privateConstructorUsedError;
  List<String> get selectedIntents => throw _privateConstructorUsedError;

  /// Serializes this ProfileUpdateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileUpdateRequestCopyWith<ProfileUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileUpdateRequestCopyWith<$Res> {
  factory $ProfileUpdateRequestCopyWith(
    ProfileUpdateRequest value,
    $Res Function(ProfileUpdateRequest) then,
  ) = _$ProfileUpdateRequestCopyWithImpl<$Res, ProfileUpdateRequest>;
  @useResult
  $Res call({
    String tone,
    NotificationSettings notifications,
    String timezone,
    String? birthDate,
    String? birthTime,
    String? birthPlace,
    String? zodiacSign,
    List<String> selectedIntents,
  });

  $NotificationSettingsCopyWith<$Res> get notifications;
}

/// @nodoc
class _$ProfileUpdateRequestCopyWithImpl<
  $Res,
  $Val extends ProfileUpdateRequest
>
    implements $ProfileUpdateRequestCopyWith<$Res> {
  _$ProfileUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tone = null,
    Object? notifications = null,
    Object? timezone = null,
    Object? birthDate = freezed,
    Object? birthTime = freezed,
    Object? birthPlace = freezed,
    Object? zodiacSign = freezed,
    Object? selectedIntents = null,
  }) {
    return _then(
      _value.copyWith(
            tone:
                null == tone
                    ? _value.tone
                    : tone // ignore: cast_nullable_to_non_nullable
                        as String,
            notifications:
                null == notifications
                    ? _value.notifications
                    : notifications // ignore: cast_nullable_to_non_nullable
                        as NotificationSettings,
            timezone:
                null == timezone
                    ? _value.timezone
                    : timezone // ignore: cast_nullable_to_non_nullable
                        as String,
            birthDate:
                freezed == birthDate
                    ? _value.birthDate
                    : birthDate // ignore: cast_nullable_to_non_nullable
                        as String?,
            birthTime:
                freezed == birthTime
                    ? _value.birthTime
                    : birthTime // ignore: cast_nullable_to_non_nullable
                        as String?,
            birthPlace:
                freezed == birthPlace
                    ? _value.birthPlace
                    : birthPlace // ignore: cast_nullable_to_non_nullable
                        as String?,
            zodiacSign:
                freezed == zodiacSign
                    ? _value.zodiacSign
                    : zodiacSign // ignore: cast_nullable_to_non_nullable
                        as String?,
            selectedIntents:
                null == selectedIntents
                    ? _value.selectedIntents
                    : selectedIntents // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res> get notifications {
    return $NotificationSettingsCopyWith<$Res>(_value.notifications, (value) {
      return _then(_value.copyWith(notifications: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileUpdateRequestImplCopyWith<$Res>
    implements $ProfileUpdateRequestCopyWith<$Res> {
  factory _$$ProfileUpdateRequestImplCopyWith(
    _$ProfileUpdateRequestImpl value,
    $Res Function(_$ProfileUpdateRequestImpl) then,
  ) = __$$ProfileUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String tone,
    NotificationSettings notifications,
    String timezone,
    String? birthDate,
    String? birthTime,
    String? birthPlace,
    String? zodiacSign,
    List<String> selectedIntents,
  });

  @override
  $NotificationSettingsCopyWith<$Res> get notifications;
}

/// @nodoc
class __$$ProfileUpdateRequestImplCopyWithImpl<$Res>
    extends _$ProfileUpdateRequestCopyWithImpl<$Res, _$ProfileUpdateRequestImpl>
    implements _$$ProfileUpdateRequestImplCopyWith<$Res> {
  __$$ProfileUpdateRequestImplCopyWithImpl(
    _$ProfileUpdateRequestImpl _value,
    $Res Function(_$ProfileUpdateRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tone = null,
    Object? notifications = null,
    Object? timezone = null,
    Object? birthDate = freezed,
    Object? birthTime = freezed,
    Object? birthPlace = freezed,
    Object? zodiacSign = freezed,
    Object? selectedIntents = null,
  }) {
    return _then(
      _$ProfileUpdateRequestImpl(
        tone:
            null == tone
                ? _value.tone
                : tone // ignore: cast_nullable_to_non_nullable
                    as String,
        notifications:
            null == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                    as NotificationSettings,
        timezone:
            null == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                    as String,
        birthDate:
            freezed == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                    as String?,
        birthTime:
            freezed == birthTime
                ? _value.birthTime
                : birthTime // ignore: cast_nullable_to_non_nullable
                    as String?,
        birthPlace:
            freezed == birthPlace
                ? _value.birthPlace
                : birthPlace // ignore: cast_nullable_to_non_nullable
                    as String?,
        zodiacSign:
            freezed == zodiacSign
                ? _value.zodiacSign
                : zodiacSign // ignore: cast_nullable_to_non_nullable
                    as String?,
        selectedIntents:
            null == selectedIntents
                ? _value._selectedIntents
                : selectedIntents // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileUpdateRequestImpl implements _ProfileUpdateRequest {
  const _$ProfileUpdateRequestImpl({
    required this.tone,
    required this.notifications,
    required this.timezone,
    this.birthDate,
    this.birthTime,
    this.birthPlace,
    this.zodiacSign,
    final List<String> selectedIntents = const [],
  }) : _selectedIntents = selectedIntents;

  factory _$ProfileUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileUpdateRequestImplFromJson(json);

  @override
  final String tone;
  @override
  final NotificationSettings notifications;
  @override
  final String timezone;
  @override
  final String? birthDate;
  @override
  final String? birthTime;
  @override
  final String? birthPlace;
  @override
  final String? zodiacSign;
  final List<String> _selectedIntents;
  @override
  @JsonKey()
  List<String> get selectedIntents {
    if (_selectedIntents is EqualUnmodifiableListView) return _selectedIntents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedIntents);
  }

  @override
  String toString() {
    return 'ProfileUpdateRequest(tone: $tone, notifications: $notifications, timezone: $timezone, birthDate: $birthDate, birthTime: $birthTime, birthPlace: $birthPlace, zodiacSign: $zodiacSign, selectedIntents: $selectedIntents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUpdateRequestImpl &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.birthTime, birthTime) ||
                other.birthTime == birthTime) &&
            (identical(other.birthPlace, birthPlace) ||
                other.birthPlace == birthPlace) &&
            (identical(other.zodiacSign, zodiacSign) ||
                other.zodiacSign == zodiacSign) &&
            const DeepCollectionEquality().equals(
              other._selectedIntents,
              _selectedIntents,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tone,
    notifications,
    timezone,
    birthDate,
    birthTime,
    birthPlace,
    zodiacSign,
    const DeepCollectionEquality().hash(_selectedIntents),
  );

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileUpdateRequestImplCopyWith<_$ProfileUpdateRequestImpl>
  get copyWith =>
      __$$ProfileUpdateRequestImplCopyWithImpl<_$ProfileUpdateRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileUpdateRequestImplToJson(this);
  }
}

abstract class _ProfileUpdateRequest implements ProfileUpdateRequest {
  const factory _ProfileUpdateRequest({
    required final String tone,
    required final NotificationSettings notifications,
    required final String timezone,
    final String? birthDate,
    final String? birthTime,
    final String? birthPlace,
    final String? zodiacSign,
    final List<String> selectedIntents,
  }) = _$ProfileUpdateRequestImpl;

  factory _ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$ProfileUpdateRequestImpl.fromJson;

  @override
  String get tone;
  @override
  NotificationSettings get notifications;
  @override
  String get timezone;
  @override
  String? get birthDate;
  @override
  String? get birthTime;
  @override
  String? get birthPlace;
  @override
  String? get zodiacSign;
  @override
  List<String> get selectedIntents;

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileUpdateRequestImplCopyWith<_$ProfileUpdateRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  bool get daily => throw _privateConstructorUsedError;
  bool get weekly => throw _privateConstructorUsedError;
  bool get monthly => throw _privateConstructorUsedError;
  bool get tarot => throw _privateConstructorUsedError;
  bool get numerology => throw _privateConstructorUsedError;

  /// Serializes this NotificationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(
    NotificationSettings value,
    $Res Function(NotificationSettings) then,
  ) = _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call({
    bool daily,
    bool weekly,
    bool monthly,
    bool tarot,
    bool numerology,
  });
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<
  $Res,
  $Val extends NotificationSettings
>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daily = null,
    Object? weekly = null,
    Object? monthly = null,
    Object? tarot = null,
    Object? numerology = null,
  }) {
    return _then(
      _value.copyWith(
            daily:
                null == daily
                    ? _value.daily
                    : daily // ignore: cast_nullable_to_non_nullable
                        as bool,
            weekly:
                null == weekly
                    ? _value.weekly
                    : weekly // ignore: cast_nullable_to_non_nullable
                        as bool,
            monthly:
                null == monthly
                    ? _value.monthly
                    : monthly // ignore: cast_nullable_to_non_nullable
                        as bool,
            tarot:
                null == tarot
                    ? _value.tarot
                    : tarot // ignore: cast_nullable_to_non_nullable
                        as bool,
            numerology:
                null == numerology
                    ? _value.numerology
                    : numerology // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationSettingsImplCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$NotificationSettingsImplCopyWith(
    _$NotificationSettingsImpl value,
    $Res Function(_$NotificationSettingsImpl) then,
  ) = __$$NotificationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool daily,
    bool weekly,
    bool monthly,
    bool tarot,
    bool numerology,
  });
}

/// @nodoc
class __$$NotificationSettingsImplCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$NotificationSettingsImpl>
    implements _$$NotificationSettingsImplCopyWith<$Res> {
  __$$NotificationSettingsImplCopyWithImpl(
    _$NotificationSettingsImpl _value,
    $Res Function(_$NotificationSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daily = null,
    Object? weekly = null,
    Object? monthly = null,
    Object? tarot = null,
    Object? numerology = null,
  }) {
    return _then(
      _$NotificationSettingsImpl(
        daily:
            null == daily
                ? _value.daily
                : daily // ignore: cast_nullable_to_non_nullable
                    as bool,
        weekly:
            null == weekly
                ? _value.weekly
                : weekly // ignore: cast_nullable_to_non_nullable
                    as bool,
        monthly:
            null == monthly
                ? _value.monthly
                : monthly // ignore: cast_nullable_to_non_nullable
                    as bool,
        tarot:
            null == tarot
                ? _value.tarot
                : tarot // ignore: cast_nullable_to_non_nullable
                    as bool,
        numerology:
            null == numerology
                ? _value.numerology
                : numerology // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl implements _NotificationSettings {
  const _$NotificationSettingsImpl({
    required this.daily,
    required this.weekly,
    required this.monthly,
    required this.tarot,
    required this.numerology,
  });

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  @override
  final bool daily;
  @override
  final bool weekly;
  @override
  final bool monthly;
  @override
  final bool tarot;
  @override
  final bool numerology;

  @override
  String toString() {
    return 'NotificationSettings(daily: $daily, weekly: $weekly, monthly: $monthly, tarot: $tarot, numerology: $numerology)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly) &&
            (identical(other.tarot, tarot) || other.tarot == tarot) &&
            (identical(other.numerology, numerology) ||
                other.numerology == numerology));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, daily, weekly, monthly, tarot, numerology);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
  get copyWith =>
      __$$NotificationSettingsImplCopyWithImpl<_$NotificationSettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsImplToJson(this);
  }
}

abstract class _NotificationSettings implements NotificationSettings {
  const factory _NotificationSettings({
    required final bool daily,
    required final bool weekly,
    required final bool monthly,
    required final bool tarot,
    required final bool numerology,
  }) = _$NotificationSettingsImpl;

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  bool get daily;
  @override
  bool get weekly;
  @override
  bool get monthly;
  @override
  bool get tarot;
  @override
  bool get numerology;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
  get copyWith => throw _privateConstructorUsedError;
}
