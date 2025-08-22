// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get birthdate => throw _privateConstructorUsedError;
  String? get zodiacSign => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  ProfileSettings get settings => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
    UserProfile value,
    $Res Function(UserProfile) then,
  ) = _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({
    String id,
    String email,
    String name,
    String? firstName,
    String? lastName,
    String? birthdate,
    String? zodiacSign,
    String? avatar,
    ProfileSettings settings,
    DateTime createdAt,
    DateTime updatedAt,
  });

  $ProfileSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthdate = freezed,
    Object? zodiacSign = freezed,
    Object? avatar = freezed,
    Object? settings = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
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
            birthdate:
                freezed == birthdate
                    ? _value.birthdate
                    : birthdate // ignore: cast_nullable_to_non_nullable
                        as String?,
            zodiacSign:
                freezed == zodiacSign
                    ? _value.zodiacSign
                    : zodiacSign // ignore: cast_nullable_to_non_nullable
                        as String?,
            avatar:
                freezed == avatar
                    ? _value.avatar
                    : avatar // ignore: cast_nullable_to_non_nullable
                        as String?,
            settings:
                null == settings
                    ? _value.settings
                    : settings // ignore: cast_nullable_to_non_nullable
                        as ProfileSettings,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileSettingsCopyWith<$Res> get settings {
    return $ProfileSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
    _$UserProfileImpl value,
    $Res Function(_$UserProfileImpl) then,
  ) = __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    String name,
    String? firstName,
    String? lastName,
    String? birthdate,
    String? zodiacSign,
    String? avatar,
    ProfileSettings settings,
    DateTime createdAt,
    DateTime updatedAt,
  });

  @override
  $ProfileSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
    _$UserProfileImpl _value,
    $Res Function(_$UserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthdate = freezed,
    Object? zodiacSign = freezed,
    Object? avatar = freezed,
    Object? settings = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$UserProfileImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
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
        birthdate:
            freezed == birthdate
                ? _value.birthdate
                : birthdate // ignore: cast_nullable_to_non_nullable
                    as String?,
        zodiacSign:
            freezed == zodiacSign
                ? _value.zodiacSign
                : zodiacSign // ignore: cast_nullable_to_non_nullable
                    as String?,
        avatar:
            freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                    as String?,
        settings:
            null == settings
                ? _value.settings
                : settings // ignore: cast_nullable_to_non_nullable
                    as ProfileSettings,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl({
    required this.id,
    required this.email,
    required this.name,
    this.firstName,
    this.lastName,
    this.birthdate,
    this.zodiacSign,
    this.avatar,
    required this.settings,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? birthdate;
  @override
  final String? zodiacSign;
  @override
  final String? avatar;
  @override
  final ProfileSettings settings;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserProfile(id: $id, email: $email, name: $name, firstName: $firstName, lastName: $lastName, birthdate: $birthdate, zodiacSign: $zodiacSign, avatar: $avatar, settings: $settings, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.zodiacSign, zodiacSign) ||
                other.zodiacSign == zodiacSign) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    name,
    firstName,
    lastName,
    birthdate,
    zodiacSign,
    avatar,
    settings,
    createdAt,
    updatedAt,
  );

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile({
    required final String id,
    required final String email,
    required final String name,
    final String? firstName,
    final String? lastName,
    final String? birthdate,
    final String? zodiacSign,
    final String? avatar,
    required final ProfileSettings settings,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get name;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get birthdate;
  @override
  String? get zodiacSign;
  @override
  String? get avatar;
  @override
  ProfileSettings get settings;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileSettings _$ProfileSettingsFromJson(Map<String, dynamic> json) {
  return _ProfileSettings.fromJson(json);
}

/// @nodoc
mixin _$ProfileSettings {
  NotificationSettings get notifications => throw _privateConstructorUsedError;
  String get horoscopeTone => throw _privateConstructorUsedError;
  bool get analyticsEnabled => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;

  /// Serializes this ProfileSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileSettingsCopyWith<ProfileSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSettingsCopyWith<$Res> {
  factory $ProfileSettingsCopyWith(
    ProfileSettings value,
    $Res Function(ProfileSettings) then,
  ) = _$ProfileSettingsCopyWithImpl<$Res, ProfileSettings>;
  @useResult
  $Res call({
    NotificationSettings notifications,
    String horoscopeTone,
    bool analyticsEnabled,
    String language,
    String timezone,
  });

  $NotificationSettingsCopyWith<$Res> get notifications;
}

/// @nodoc
class _$ProfileSettingsCopyWithImpl<$Res, $Val extends ProfileSettings>
    implements $ProfileSettingsCopyWith<$Res> {
  _$ProfileSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? horoscopeTone = null,
    Object? analyticsEnabled = null,
    Object? language = null,
    Object? timezone = null,
  }) {
    return _then(
      _value.copyWith(
            notifications:
                null == notifications
                    ? _value.notifications
                    : notifications // ignore: cast_nullable_to_non_nullable
                        as NotificationSettings,
            horoscopeTone:
                null == horoscopeTone
                    ? _value.horoscopeTone
                    : horoscopeTone // ignore: cast_nullable_to_non_nullable
                        as String,
            analyticsEnabled:
                null == analyticsEnabled
                    ? _value.analyticsEnabled
                    : analyticsEnabled // ignore: cast_nullable_to_non_nullable
                        as bool,
            language:
                null == language
                    ? _value.language
                    : language // ignore: cast_nullable_to_non_nullable
                        as String,
            timezone:
                null == timezone
                    ? _value.timezone
                    : timezone // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileSettings
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
abstract class _$$ProfileSettingsImplCopyWith<$Res>
    implements $ProfileSettingsCopyWith<$Res> {
  factory _$$ProfileSettingsImplCopyWith(
    _$ProfileSettingsImpl value,
    $Res Function(_$ProfileSettingsImpl) then,
  ) = __$$ProfileSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    NotificationSettings notifications,
    String horoscopeTone,
    bool analyticsEnabled,
    String language,
    String timezone,
  });

  @override
  $NotificationSettingsCopyWith<$Res> get notifications;
}

/// @nodoc
class __$$ProfileSettingsImplCopyWithImpl<$Res>
    extends _$ProfileSettingsCopyWithImpl<$Res, _$ProfileSettingsImpl>
    implements _$$ProfileSettingsImplCopyWith<$Res> {
  __$$ProfileSettingsImplCopyWithImpl(
    _$ProfileSettingsImpl _value,
    $Res Function(_$ProfileSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? horoscopeTone = null,
    Object? analyticsEnabled = null,
    Object? language = null,
    Object? timezone = null,
  }) {
    return _then(
      _$ProfileSettingsImpl(
        notifications:
            null == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                    as NotificationSettings,
        horoscopeTone:
            null == horoscopeTone
                ? _value.horoscopeTone
                : horoscopeTone // ignore: cast_nullable_to_non_nullable
                    as String,
        analyticsEnabled:
            null == analyticsEnabled
                ? _value.analyticsEnabled
                : analyticsEnabled // ignore: cast_nullable_to_non_nullable
                    as bool,
        language:
            null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                    as String,
        timezone:
            null == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileSettingsImpl implements _ProfileSettings {
  const _$ProfileSettingsImpl({
    required this.notifications,
    this.horoscopeTone = 'serious',
    this.analyticsEnabled = true,
    this.language = 'en',
    this.timezone = 'UTC',
  });

  factory _$ProfileSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileSettingsImplFromJson(json);

  @override
  final NotificationSettings notifications;
  @override
  @JsonKey()
  final String horoscopeTone;
  @override
  @JsonKey()
  final bool analyticsEnabled;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final String timezone;

  @override
  String toString() {
    return 'ProfileSettings(notifications: $notifications, horoscopeTone: $horoscopeTone, analyticsEnabled: $analyticsEnabled, language: $language, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSettingsImpl &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications) &&
            (identical(other.horoscopeTone, horoscopeTone) ||
                other.horoscopeTone == horoscopeTone) &&
            (identical(other.analyticsEnabled, analyticsEnabled) ||
                other.analyticsEnabled == analyticsEnabled) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    notifications,
    horoscopeTone,
    analyticsEnabled,
    language,
    timezone,
  );

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSettingsImplCopyWith<_$ProfileSettingsImpl> get copyWith =>
      __$$ProfileSettingsImplCopyWithImpl<_$ProfileSettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileSettingsImplToJson(this);
  }
}

abstract class _ProfileSettings implements ProfileSettings {
  const factory _ProfileSettings({
    required final NotificationSettings notifications,
    final String horoscopeTone,
    final bool analyticsEnabled,
    final String language,
    final String timezone,
  }) = _$ProfileSettingsImpl;

  factory _ProfileSettings.fromJson(Map<String, dynamic> json) =
      _$ProfileSettingsImpl.fromJson;

  @override
  NotificationSettings get notifications;
  @override
  String get horoscopeTone;
  @override
  bool get analyticsEnabled;
  @override
  String get language;
  @override
  String get timezone;

  /// Create a copy of ProfileSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileSettingsImplCopyWith<_$ProfileSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  bool get dailyHoroscope => throw _privateConstructorUsedError;
  bool get weeklyForecast => throw _privateConstructorUsedError;
  bool get monthlyInsights => throw _privateConstructorUsedError;
  bool get numerologyUpdates => throw _privateConstructorUsedError;
  bool get specialEvents => throw _privateConstructorUsedError;

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
    bool dailyHoroscope,
    bool weeklyForecast,
    bool monthlyInsights,
    bool numerologyUpdates,
    bool specialEvents,
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
    Object? dailyHoroscope = null,
    Object? weeklyForecast = null,
    Object? monthlyInsights = null,
    Object? numerologyUpdates = null,
    Object? specialEvents = null,
  }) {
    return _then(
      _value.copyWith(
            dailyHoroscope:
                null == dailyHoroscope
                    ? _value.dailyHoroscope
                    : dailyHoroscope // ignore: cast_nullable_to_non_nullable
                        as bool,
            weeklyForecast:
                null == weeklyForecast
                    ? _value.weeklyForecast
                    : weeklyForecast // ignore: cast_nullable_to_non_nullable
                        as bool,
            monthlyInsights:
                null == monthlyInsights
                    ? _value.monthlyInsights
                    : monthlyInsights // ignore: cast_nullable_to_non_nullable
                        as bool,
            numerologyUpdates:
                null == numerologyUpdates
                    ? _value.numerologyUpdates
                    : numerologyUpdates // ignore: cast_nullable_to_non_nullable
                        as bool,
            specialEvents:
                null == specialEvents
                    ? _value.specialEvents
                    : specialEvents // ignore: cast_nullable_to_non_nullable
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
    bool dailyHoroscope,
    bool weeklyForecast,
    bool monthlyInsights,
    bool numerologyUpdates,
    bool specialEvents,
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
    Object? dailyHoroscope = null,
    Object? weeklyForecast = null,
    Object? monthlyInsights = null,
    Object? numerologyUpdates = null,
    Object? specialEvents = null,
  }) {
    return _then(
      _$NotificationSettingsImpl(
        dailyHoroscope:
            null == dailyHoroscope
                ? _value.dailyHoroscope
                : dailyHoroscope // ignore: cast_nullable_to_non_nullable
                    as bool,
        weeklyForecast:
            null == weeklyForecast
                ? _value.weeklyForecast
                : weeklyForecast // ignore: cast_nullable_to_non_nullable
                    as bool,
        monthlyInsights:
            null == monthlyInsights
                ? _value.monthlyInsights
                : monthlyInsights // ignore: cast_nullable_to_non_nullable
                    as bool,
        numerologyUpdates:
            null == numerologyUpdates
                ? _value.numerologyUpdates
                : numerologyUpdates // ignore: cast_nullable_to_non_nullable
                    as bool,
        specialEvents:
            null == specialEvents
                ? _value.specialEvents
                : specialEvents // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl implements _NotificationSettings {
  const _$NotificationSettingsImpl({
    required this.dailyHoroscope,
    required this.weeklyForecast,
    required this.monthlyInsights,
    required this.numerologyUpdates,
    required this.specialEvents,
  });

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  @override
  final bool dailyHoroscope;
  @override
  final bool weeklyForecast;
  @override
  final bool monthlyInsights;
  @override
  final bool numerologyUpdates;
  @override
  final bool specialEvents;

  @override
  String toString() {
    return 'NotificationSettings(dailyHoroscope: $dailyHoroscope, weeklyForecast: $weeklyForecast, monthlyInsights: $monthlyInsights, numerologyUpdates: $numerologyUpdates, specialEvents: $specialEvents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            (identical(other.dailyHoroscope, dailyHoroscope) ||
                other.dailyHoroscope == dailyHoroscope) &&
            (identical(other.weeklyForecast, weeklyForecast) ||
                other.weeklyForecast == weeklyForecast) &&
            (identical(other.monthlyInsights, monthlyInsights) ||
                other.monthlyInsights == monthlyInsights) &&
            (identical(other.numerologyUpdates, numerologyUpdates) ||
                other.numerologyUpdates == numerologyUpdates) &&
            (identical(other.specialEvents, specialEvents) ||
                other.specialEvents == specialEvents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dailyHoroscope,
    weeklyForecast,
    monthlyInsights,
    numerologyUpdates,
    specialEvents,
  );

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
    required final bool dailyHoroscope,
    required final bool weeklyForecast,
    required final bool monthlyInsights,
    required final bool numerologyUpdates,
    required final bool specialEvents,
  }) = _$NotificationSettingsImpl;

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  bool get dailyHoroscope;
  @override
  bool get weeklyForecast;
  @override
  bool get monthlyInsights;
  @override
  bool get numerologyUpdates;
  @override
  bool get specialEvents;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ProfileUpdateRequest _$ProfileUpdateRequestFromJson(Map<String, dynamic> json) {
  return _ProfileUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$ProfileUpdateRequest {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get birthdate => throw _privateConstructorUsedError;
  String? get zodiacSign => throw _privateConstructorUsedError;
  ProfileSettings? get settings => throw _privateConstructorUsedError;

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
    String? firstName,
    String? lastName,
    String? birthdate,
    String? zodiacSign,
    ProfileSettings? settings,
  });

  $ProfileSettingsCopyWith<$Res>? get settings;
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
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthdate = freezed,
    Object? zodiacSign = freezed,
    Object? settings = freezed,
  }) {
    return _then(
      _value.copyWith(
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
            birthdate:
                freezed == birthdate
                    ? _value.birthdate
                    : birthdate // ignore: cast_nullable_to_non_nullable
                        as String?,
            zodiacSign:
                freezed == zodiacSign
                    ? _value.zodiacSign
                    : zodiacSign // ignore: cast_nullable_to_non_nullable
                        as String?,
            settings:
                freezed == settings
                    ? _value.settings
                    : settings // ignore: cast_nullable_to_non_nullable
                        as ProfileSettings?,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileSettingsCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $ProfileSettingsCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
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
    String? firstName,
    String? lastName,
    String? birthdate,
    String? zodiacSign,
    ProfileSettings? settings,
  });

  @override
  $ProfileSettingsCopyWith<$Res>? get settings;
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
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthdate = freezed,
    Object? zodiacSign = freezed,
    Object? settings = freezed,
  }) {
    return _then(
      _$ProfileUpdateRequestImpl(
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
        birthdate:
            freezed == birthdate
                ? _value.birthdate
                : birthdate // ignore: cast_nullable_to_non_nullable
                    as String?,
        zodiacSign:
            freezed == zodiacSign
                ? _value.zodiacSign
                : zodiacSign // ignore: cast_nullable_to_non_nullable
                    as String?,
        settings:
            freezed == settings
                ? _value.settings
                : settings // ignore: cast_nullable_to_non_nullable
                    as ProfileSettings?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileUpdateRequestImpl implements _ProfileUpdateRequest {
  const _$ProfileUpdateRequestImpl({
    this.firstName,
    this.lastName,
    this.birthdate,
    this.zodiacSign,
    this.settings,
  });

  factory _$ProfileUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileUpdateRequestImplFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? birthdate;
  @override
  final String? zodiacSign;
  @override
  final ProfileSettings? settings;

  @override
  String toString() {
    return 'ProfileUpdateRequest(firstName: $firstName, lastName: $lastName, birthdate: $birthdate, zodiacSign: $zodiacSign, settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUpdateRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.zodiacSign, zodiacSign) ||
                other.zodiacSign == zodiacSign) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    firstName,
    lastName,
    birthdate,
    zodiacSign,
    settings,
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
    final String? firstName,
    final String? lastName,
    final String? birthdate,
    final String? zodiacSign,
    final ProfileSettings? settings,
  }) = _$ProfileUpdateRequestImpl;

  factory _ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$ProfileUpdateRequestImpl.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get birthdate;
  @override
  String? get zodiacSign;
  @override
  ProfileSettings? get settings;

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileUpdateRequestImplCopyWith<_$ProfileUpdateRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
