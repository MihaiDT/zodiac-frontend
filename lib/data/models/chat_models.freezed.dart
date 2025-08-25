// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatMessageRequest _$ChatMessageRequestFromJson(Map<String, dynamic> json) {
  return _ChatMessageRequest.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageRequest {
  String get message => throw _privateConstructorUsedError;
  ChatTone get tone => throw _privateConstructorUsedError;

  /// Serializes this ChatMessageRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageRequestCopyWith<ChatMessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageRequestCopyWith<$Res> {
  factory $ChatMessageRequestCopyWith(
    ChatMessageRequest value,
    $Res Function(ChatMessageRequest) then,
  ) = _$ChatMessageRequestCopyWithImpl<$Res, ChatMessageRequest>;
  @useResult
  $Res call({String message, ChatTone tone});
}

/// @nodoc
class _$ChatMessageRequestCopyWithImpl<$Res, $Val extends ChatMessageRequest>
    implements $ChatMessageRequestCopyWith<$Res> {
  _$ChatMessageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? tone = null}) {
    return _then(
      _value.copyWith(
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            tone:
                null == tone
                    ? _value.tone
                    : tone // ignore: cast_nullable_to_non_nullable
                        as ChatTone,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatMessageRequestImplCopyWith<$Res>
    implements $ChatMessageRequestCopyWith<$Res> {
  factory _$$ChatMessageRequestImplCopyWith(
    _$ChatMessageRequestImpl value,
    $Res Function(_$ChatMessageRequestImpl) then,
  ) = __$$ChatMessageRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, ChatTone tone});
}

/// @nodoc
class __$$ChatMessageRequestImplCopyWithImpl<$Res>
    extends _$ChatMessageRequestCopyWithImpl<$Res, _$ChatMessageRequestImpl>
    implements _$$ChatMessageRequestImplCopyWith<$Res> {
  __$$ChatMessageRequestImplCopyWithImpl(
    _$ChatMessageRequestImpl _value,
    $Res Function(_$ChatMessageRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? tone = null}) {
    return _then(
      _$ChatMessageRequestImpl(
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        tone:
            null == tone
                ? _value.tone
                : tone // ignore: cast_nullable_to_non_nullable
                    as ChatTone,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageRequestImpl implements _ChatMessageRequest {
  const _$ChatMessageRequestImpl({
    required this.message,
    this.tone = ChatTone.mystical,
  });

  factory _$ChatMessageRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageRequestImplFromJson(json);

  @override
  final String message;
  @override
  @JsonKey()
  final ChatTone tone;

  @override
  String toString() {
    return 'ChatMessageRequest(message: $message, tone: $tone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageRequestImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.tone, tone) || other.tone == tone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, tone);

  /// Create a copy of ChatMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageRequestImplCopyWith<_$ChatMessageRequestImpl> get copyWith =>
      __$$ChatMessageRequestImplCopyWithImpl<_$ChatMessageRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageRequestImplToJson(this);
  }
}

abstract class _ChatMessageRequest implements ChatMessageRequest {
  const factory _ChatMessageRequest({
    required final String message,
    final ChatTone tone,
  }) = _$ChatMessageRequestImpl;

  factory _ChatMessageRequest.fromJson(Map<String, dynamic> json) =
      _$ChatMessageRequestImpl.fromJson;

  @override
  String get message;
  @override
  ChatTone get tone;

  /// Create a copy of ChatMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageRequestImplCopyWith<_$ChatMessageRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessageData _$ChatMessageDataFromJson(Map<String, dynamic> json) {
  return _ChatMessageData.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageData {
  String get response => throw _privateConstructorUsedError;
  String get conversationId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this ChatMessageData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageDataCopyWith<ChatMessageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageDataCopyWith<$Res> {
  factory $ChatMessageDataCopyWith(
    ChatMessageData value,
    $Res Function(ChatMessageData) then,
  ) = _$ChatMessageDataCopyWithImpl<$Res, ChatMessageData>;
  @useResult
  $Res call({String response, String conversationId, DateTime timestamp});
}

/// @nodoc
class _$ChatMessageDataCopyWithImpl<$Res, $Val extends ChatMessageData>
    implements $ChatMessageDataCopyWith<$Res> {
  _$ChatMessageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? conversationId = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            response:
                null == response
                    ? _value.response
                    : response // ignore: cast_nullable_to_non_nullable
                        as String,
            conversationId:
                null == conversationId
                    ? _value.conversationId
                    : conversationId // ignore: cast_nullable_to_non_nullable
                        as String,
            timestamp:
                null == timestamp
                    ? _value.timestamp
                    : timestamp // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatMessageDataImplCopyWith<$Res>
    implements $ChatMessageDataCopyWith<$Res> {
  factory _$$ChatMessageDataImplCopyWith(
    _$ChatMessageDataImpl value,
    $Res Function(_$ChatMessageDataImpl) then,
  ) = __$$ChatMessageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String response, String conversationId, DateTime timestamp});
}

/// @nodoc
class __$$ChatMessageDataImplCopyWithImpl<$Res>
    extends _$ChatMessageDataCopyWithImpl<$Res, _$ChatMessageDataImpl>
    implements _$$ChatMessageDataImplCopyWith<$Res> {
  __$$ChatMessageDataImplCopyWithImpl(
    _$ChatMessageDataImpl _value,
    $Res Function(_$ChatMessageDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatMessageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? conversationId = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$ChatMessageDataImpl(
        response:
            null == response
                ? _value.response
                : response // ignore: cast_nullable_to_non_nullable
                    as String,
        conversationId:
            null == conversationId
                ? _value.conversationId
                : conversationId // ignore: cast_nullable_to_non_nullable
                    as String,
        timestamp:
            null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageDataImpl implements _ChatMessageData {
  const _$ChatMessageDataImpl({
    required this.response,
    required this.conversationId,
    required this.timestamp,
  });

  factory _$ChatMessageDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageDataImplFromJson(json);

  @override
  final String response;
  @override
  final String conversationId;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'ChatMessageData(response: $response, conversationId: $conversationId, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageDataImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, response, conversationId, timestamp);

  /// Create a copy of ChatMessageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageDataImplCopyWith<_$ChatMessageDataImpl> get copyWith =>
      __$$ChatMessageDataImplCopyWithImpl<_$ChatMessageDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageDataImplToJson(this);
  }
}

abstract class _ChatMessageData implements ChatMessageData {
  const factory _ChatMessageData({
    required final String response,
    required final String conversationId,
    required final DateTime timestamp,
  }) = _$ChatMessageDataImpl;

  factory _ChatMessageData.fromJson(Map<String, dynamic> json) =
      _$ChatMessageDataImpl.fromJson;

  @override
  String get response;
  @override
  String get conversationId;
  @override
  DateTime get timestamp;

  /// Create a copy of ChatMessageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageDataImplCopyWith<_$ChatMessageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessageResponse _$ChatMessageResponseFromJson(Map<String, dynamic> json) {
  return _ChatMessageResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageResponse {
  bool get success => throw _privateConstructorUsedError;
  ChatMessageData get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this ChatMessageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageResponseCopyWith<ChatMessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageResponseCopyWith<$Res> {
  factory $ChatMessageResponseCopyWith(
    ChatMessageResponse value,
    $Res Function(ChatMessageResponse) then,
  ) = _$ChatMessageResponseCopyWithImpl<$Res, ChatMessageResponse>;
  @useResult
  $Res call({bool success, ChatMessageData data, String? error});

  $ChatMessageDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ChatMessageResponseCopyWithImpl<$Res, $Val extends ChatMessageResponse>
    implements $ChatMessageResponseCopyWith<$Res> {
  _$ChatMessageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            success:
                null == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool,
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as ChatMessageData,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMessageDataCopyWith<$Res> get data {
    return $ChatMessageDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatMessageResponseImplCopyWith<$Res>
    implements $ChatMessageResponseCopyWith<$Res> {
  factory _$$ChatMessageResponseImplCopyWith(
    _$ChatMessageResponseImpl value,
    $Res Function(_$ChatMessageResponseImpl) then,
  ) = __$$ChatMessageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, ChatMessageData data, String? error});

  @override
  $ChatMessageDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ChatMessageResponseImplCopyWithImpl<$Res>
    extends _$ChatMessageResponseCopyWithImpl<$Res, _$ChatMessageResponseImpl>
    implements _$$ChatMessageResponseImplCopyWith<$Res> {
  __$$ChatMessageResponseImplCopyWithImpl(
    _$ChatMessageResponseImpl _value,
    $Res Function(_$ChatMessageResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
  }) {
    return _then(
      _$ChatMessageResponseImpl(
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        data:
            null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as ChatMessageData,
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
class _$ChatMessageResponseImpl implements _ChatMessageResponse {
  const _$ChatMessageResponseImpl({
    required this.success,
    required this.data,
    this.error,
  });

  factory _$ChatMessageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final ChatMessageData data;
  @override
  final String? error;

  @override
  String toString() {
    return 'ChatMessageResponse(success: $success, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, error);

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageResponseImplCopyWith<_$ChatMessageResponseImpl> get copyWith =>
      __$$ChatMessageResponseImplCopyWithImpl<_$ChatMessageResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageResponseImplToJson(this);
  }
}

abstract class _ChatMessageResponse implements ChatMessageResponse {
  const factory _ChatMessageResponse({
    required final bool success,
    required final ChatMessageData data,
    final String? error,
  }) = _$ChatMessageResponseImpl;

  factory _ChatMessageResponse.fromJson(Map<String, dynamic> json) =
      _$ChatMessageResponseImpl.fromJson;

  @override
  bool get success;
  @override
  ChatMessageData get data;
  @override
  String? get error;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageResponseImplCopyWith<_$ChatMessageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatConversation _$ChatConversationFromJson(Map<String, dynamic> json) {
  return _ChatConversation.fromJson(json);
}

/// @nodoc
mixin _$ChatConversation {
  String get id => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  int get messageCount => throw _privateConstructorUsedError;

  /// Serializes this ChatConversation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatConversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatConversationCopyWith<ChatConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatConversationCopyWith<$Res> {
  factory $ChatConversationCopyWith(
    ChatConversation value,
    $Res Function(ChatConversation) then,
  ) = _$ChatConversationCopyWithImpl<$Res, ChatConversation>;
  @useResult
  $Res call({
    String id,
    String lastMessage,
    DateTime timestamp,
    int messageCount,
  });
}

/// @nodoc
class _$ChatConversationCopyWithImpl<$Res, $Val extends ChatConversation>
    implements $ChatConversationCopyWith<$Res> {
  _$ChatConversationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatConversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastMessage = null,
    Object? timestamp = null,
    Object? messageCount = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            lastMessage:
                null == lastMessage
                    ? _value.lastMessage
                    : lastMessage // ignore: cast_nullable_to_non_nullable
                        as String,
            timestamp:
                null == timestamp
                    ? _value.timestamp
                    : timestamp // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            messageCount:
                null == messageCount
                    ? _value.messageCount
                    : messageCount // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatConversationImplCopyWith<$Res>
    implements $ChatConversationCopyWith<$Res> {
  factory _$$ChatConversationImplCopyWith(
    _$ChatConversationImpl value,
    $Res Function(_$ChatConversationImpl) then,
  ) = __$$ChatConversationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String lastMessage,
    DateTime timestamp,
    int messageCount,
  });
}

/// @nodoc
class __$$ChatConversationImplCopyWithImpl<$Res>
    extends _$ChatConversationCopyWithImpl<$Res, _$ChatConversationImpl>
    implements _$$ChatConversationImplCopyWith<$Res> {
  __$$ChatConversationImplCopyWithImpl(
    _$ChatConversationImpl _value,
    $Res Function(_$ChatConversationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatConversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastMessage = null,
    Object? timestamp = null,
    Object? messageCount = null,
  }) {
    return _then(
      _$ChatConversationImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        lastMessage:
            null == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                    as String,
        timestamp:
            null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        messageCount:
            null == messageCount
                ? _value.messageCount
                : messageCount // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatConversationImpl implements _ChatConversation {
  const _$ChatConversationImpl({
    required this.id,
    required this.lastMessage,
    required this.timestamp,
    required this.messageCount,
  });

  factory _$ChatConversationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatConversationImplFromJson(json);

  @override
  final String id;
  @override
  final String lastMessage;
  @override
  final DateTime timestamp;
  @override
  final int messageCount;

  @override
  String toString() {
    return 'ChatConversation(id: $id, lastMessage: $lastMessage, timestamp: $timestamp, messageCount: $messageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatConversationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, lastMessage, timestamp, messageCount);

  /// Create a copy of ChatConversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatConversationImplCopyWith<_$ChatConversationImpl> get copyWith =>
      __$$ChatConversationImplCopyWithImpl<_$ChatConversationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatConversationImplToJson(this);
  }
}

abstract class _ChatConversation implements ChatConversation {
  const factory _ChatConversation({
    required final String id,
    required final String lastMessage,
    required final DateTime timestamp,
    required final int messageCount,
  }) = _$ChatConversationImpl;

  factory _ChatConversation.fromJson(Map<String, dynamic> json) =
      _$ChatConversationImpl.fromJson;

  @override
  String get id;
  @override
  String get lastMessage;
  @override
  DateTime get timestamp;
  @override
  int get messageCount;

  /// Create a copy of ChatConversation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatConversationImplCopyWith<_$ChatConversationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatHistoryData _$ChatHistoryDataFromJson(Map<String, dynamic> json) {
  return _ChatHistoryData.fromJson(json);
}

/// @nodoc
mixin _$ChatHistoryData {
  List<ChatConversation> get conversations =>
      throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Serializes this ChatHistoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatHistoryDataCopyWith<ChatHistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatHistoryDataCopyWith<$Res> {
  factory $ChatHistoryDataCopyWith(
    ChatHistoryData value,
    $Res Function(ChatHistoryData) then,
  ) = _$ChatHistoryDataCopyWithImpl<$Res, ChatHistoryData>;
  @useResult
  $Res call({List<ChatConversation> conversations, int total, bool hasMore});
}

/// @nodoc
class _$ChatHistoryDataCopyWithImpl<$Res, $Val extends ChatHistoryData>
    implements $ChatHistoryDataCopyWith<$Res> {
  _$ChatHistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
    Object? total = null,
    Object? hasMore = null,
  }) {
    return _then(
      _value.copyWith(
            conversations:
                null == conversations
                    ? _value.conversations
                    : conversations // ignore: cast_nullable_to_non_nullable
                        as List<ChatConversation>,
            total:
                null == total
                    ? _value.total
                    : total // ignore: cast_nullable_to_non_nullable
                        as int,
            hasMore:
                null == hasMore
                    ? _value.hasMore
                    : hasMore // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatHistoryDataImplCopyWith<$Res>
    implements $ChatHistoryDataCopyWith<$Res> {
  factory _$$ChatHistoryDataImplCopyWith(
    _$ChatHistoryDataImpl value,
    $Res Function(_$ChatHistoryDataImpl) then,
  ) = __$$ChatHistoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatConversation> conversations, int total, bool hasMore});
}

/// @nodoc
class __$$ChatHistoryDataImplCopyWithImpl<$Res>
    extends _$ChatHistoryDataCopyWithImpl<$Res, _$ChatHistoryDataImpl>
    implements _$$ChatHistoryDataImplCopyWith<$Res> {
  __$$ChatHistoryDataImplCopyWithImpl(
    _$ChatHistoryDataImpl _value,
    $Res Function(_$ChatHistoryDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
    Object? total = null,
    Object? hasMore = null,
  }) {
    return _then(
      _$ChatHistoryDataImpl(
        conversations:
            null == conversations
                ? _value._conversations
                : conversations // ignore: cast_nullable_to_non_nullable
                    as List<ChatConversation>,
        total:
            null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                    as int,
        hasMore:
            null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatHistoryDataImpl implements _ChatHistoryData {
  const _$ChatHistoryDataImpl({
    required final List<ChatConversation> conversations,
    required this.total,
    required this.hasMore,
  }) : _conversations = conversations;

  factory _$ChatHistoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatHistoryDataImplFromJson(json);

  final List<ChatConversation> _conversations;
  @override
  List<ChatConversation> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  @override
  final int total;
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'ChatHistoryData(conversations: $conversations, total: $total, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatHistoryDataImpl &&
            const DeepCollectionEquality().equals(
              other._conversations,
              _conversations,
            ) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_conversations),
    total,
    hasMore,
  );

  /// Create a copy of ChatHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatHistoryDataImplCopyWith<_$ChatHistoryDataImpl> get copyWith =>
      __$$ChatHistoryDataImplCopyWithImpl<_$ChatHistoryDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatHistoryDataImplToJson(this);
  }
}

abstract class _ChatHistoryData implements ChatHistoryData {
  const factory _ChatHistoryData({
    required final List<ChatConversation> conversations,
    required final int total,
    required final bool hasMore,
  }) = _$ChatHistoryDataImpl;

  factory _ChatHistoryData.fromJson(Map<String, dynamic> json) =
      _$ChatHistoryDataImpl.fromJson;

  @override
  List<ChatConversation> get conversations;
  @override
  int get total;
  @override
  bool get hasMore;

  /// Create a copy of ChatHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatHistoryDataImplCopyWith<_$ChatHistoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatHistoryResponse _$ChatHistoryResponseFromJson(Map<String, dynamic> json) {
  return _ChatHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatHistoryResponse {
  bool get success => throw _privateConstructorUsedError;
  ChatHistoryData get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this ChatHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatHistoryResponseCopyWith<ChatHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatHistoryResponseCopyWith<$Res> {
  factory $ChatHistoryResponseCopyWith(
    ChatHistoryResponse value,
    $Res Function(ChatHistoryResponse) then,
  ) = _$ChatHistoryResponseCopyWithImpl<$Res, ChatHistoryResponse>;
  @useResult
  $Res call({bool success, ChatHistoryData data, String? error});

  $ChatHistoryDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ChatHistoryResponseCopyWithImpl<$Res, $Val extends ChatHistoryResponse>
    implements $ChatHistoryResponseCopyWith<$Res> {
  _$ChatHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            success:
                null == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool,
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as ChatHistoryData,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatHistoryDataCopyWith<$Res> get data {
    return $ChatHistoryDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatHistoryResponseImplCopyWith<$Res>
    implements $ChatHistoryResponseCopyWith<$Res> {
  factory _$$ChatHistoryResponseImplCopyWith(
    _$ChatHistoryResponseImpl value,
    $Res Function(_$ChatHistoryResponseImpl) then,
  ) = __$$ChatHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, ChatHistoryData data, String? error});

  @override
  $ChatHistoryDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ChatHistoryResponseImplCopyWithImpl<$Res>
    extends _$ChatHistoryResponseCopyWithImpl<$Res, _$ChatHistoryResponseImpl>
    implements _$$ChatHistoryResponseImplCopyWith<$Res> {
  __$$ChatHistoryResponseImplCopyWithImpl(
    _$ChatHistoryResponseImpl _value,
    $Res Function(_$ChatHistoryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
  }) {
    return _then(
      _$ChatHistoryResponseImpl(
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        data:
            null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as ChatHistoryData,
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
class _$ChatHistoryResponseImpl implements _ChatHistoryResponse {
  const _$ChatHistoryResponseImpl({
    required this.success,
    required this.data,
    this.error,
  });

  factory _$ChatHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatHistoryResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final ChatHistoryData data;
  @override
  final String? error;

  @override
  String toString() {
    return 'ChatHistoryResponse(success: $success, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatHistoryResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, error);

  /// Create a copy of ChatHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatHistoryResponseImplCopyWith<_$ChatHistoryResponseImpl> get copyWith =>
      __$$ChatHistoryResponseImplCopyWithImpl<_$ChatHistoryResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatHistoryResponseImplToJson(this);
  }
}

abstract class _ChatHistoryResponse implements ChatHistoryResponse {
  const factory _ChatHistoryResponse({
    required final bool success,
    required final ChatHistoryData data,
    final String? error,
  }) = _$ChatHistoryResponseImpl;

  factory _ChatHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$ChatHistoryResponseImpl.fromJson;

  @override
  bool get success;
  @override
  ChatHistoryData get data;
  @override
  String? get error;

  /// Create a copy of ChatHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatHistoryResponseImplCopyWith<_$ChatHistoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatStatsData _$ChatStatsDataFromJson(Map<String, dynamic> json) {
  return _ChatStatsData.fromJson(json);
}

/// @nodoc
mixin _$ChatStatsData {
  int get totalMessages => throw _privateConstructorUsedError;
  int get todayMessages => throw _privateConstructorUsedError;
  int get remainingToday => throw _privateConstructorUsedError;

  /// Serializes this ChatStatsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatStatsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStatsDataCopyWith<ChatStatsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStatsDataCopyWith<$Res> {
  factory $ChatStatsDataCopyWith(
    ChatStatsData value,
    $Res Function(ChatStatsData) then,
  ) = _$ChatStatsDataCopyWithImpl<$Res, ChatStatsData>;
  @useResult
  $Res call({int totalMessages, int todayMessages, int remainingToday});
}

/// @nodoc
class _$ChatStatsDataCopyWithImpl<$Res, $Val extends ChatStatsData>
    implements $ChatStatsDataCopyWith<$Res> {
  _$ChatStatsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatStatsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMessages = null,
    Object? todayMessages = null,
    Object? remainingToday = null,
  }) {
    return _then(
      _value.copyWith(
            totalMessages:
                null == totalMessages
                    ? _value.totalMessages
                    : totalMessages // ignore: cast_nullable_to_non_nullable
                        as int,
            todayMessages:
                null == todayMessages
                    ? _value.todayMessages
                    : todayMessages // ignore: cast_nullable_to_non_nullable
                        as int,
            remainingToday:
                null == remainingToday
                    ? _value.remainingToday
                    : remainingToday // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatStatsDataImplCopyWith<$Res>
    implements $ChatStatsDataCopyWith<$Res> {
  factory _$$ChatStatsDataImplCopyWith(
    _$ChatStatsDataImpl value,
    $Res Function(_$ChatStatsDataImpl) then,
  ) = __$$ChatStatsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalMessages, int todayMessages, int remainingToday});
}

/// @nodoc
class __$$ChatStatsDataImplCopyWithImpl<$Res>
    extends _$ChatStatsDataCopyWithImpl<$Res, _$ChatStatsDataImpl>
    implements _$$ChatStatsDataImplCopyWith<$Res> {
  __$$ChatStatsDataImplCopyWithImpl(
    _$ChatStatsDataImpl _value,
    $Res Function(_$ChatStatsDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatStatsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMessages = null,
    Object? todayMessages = null,
    Object? remainingToday = null,
  }) {
    return _then(
      _$ChatStatsDataImpl(
        totalMessages:
            null == totalMessages
                ? _value.totalMessages
                : totalMessages // ignore: cast_nullable_to_non_nullable
                    as int,
        todayMessages:
            null == todayMessages
                ? _value.todayMessages
                : todayMessages // ignore: cast_nullable_to_non_nullable
                    as int,
        remainingToday:
            null == remainingToday
                ? _value.remainingToday
                : remainingToday // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatStatsDataImpl implements _ChatStatsData {
  const _$ChatStatsDataImpl({
    required this.totalMessages,
    required this.todayMessages,
    required this.remainingToday,
  });

  factory _$ChatStatsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatStatsDataImplFromJson(json);

  @override
  final int totalMessages;
  @override
  final int todayMessages;
  @override
  final int remainingToday;

  @override
  String toString() {
    return 'ChatStatsData(totalMessages: $totalMessages, todayMessages: $todayMessages, remainingToday: $remainingToday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStatsDataImpl &&
            (identical(other.totalMessages, totalMessages) ||
                other.totalMessages == totalMessages) &&
            (identical(other.todayMessages, todayMessages) ||
                other.todayMessages == todayMessages) &&
            (identical(other.remainingToday, remainingToday) ||
                other.remainingToday == remainingToday));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalMessages, todayMessages, remainingToday);

  /// Create a copy of ChatStatsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStatsDataImplCopyWith<_$ChatStatsDataImpl> get copyWith =>
      __$$ChatStatsDataImplCopyWithImpl<_$ChatStatsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatStatsDataImplToJson(this);
  }
}

abstract class _ChatStatsData implements ChatStatsData {
  const factory _ChatStatsData({
    required final int totalMessages,
    required final int todayMessages,
    required final int remainingToday,
  }) = _$ChatStatsDataImpl;

  factory _ChatStatsData.fromJson(Map<String, dynamic> json) =
      _$ChatStatsDataImpl.fromJson;

  @override
  int get totalMessages;
  @override
  int get todayMessages;
  @override
  int get remainingToday;

  /// Create a copy of ChatStatsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStatsDataImplCopyWith<_$ChatStatsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatStatsResponse _$ChatStatsResponseFromJson(Map<String, dynamic> json) {
  return _ChatStatsResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatStatsResponse {
  bool get success => throw _privateConstructorUsedError;
  ChatStatsData get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this ChatStatsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStatsResponseCopyWith<ChatStatsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStatsResponseCopyWith<$Res> {
  factory $ChatStatsResponseCopyWith(
    ChatStatsResponse value,
    $Res Function(ChatStatsResponse) then,
  ) = _$ChatStatsResponseCopyWithImpl<$Res, ChatStatsResponse>;
  @useResult
  $Res call({bool success, ChatStatsData data, String? error});

  $ChatStatsDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ChatStatsResponseCopyWithImpl<$Res, $Val extends ChatStatsResponse>
    implements $ChatStatsResponseCopyWith<$Res> {
  _$ChatStatsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            success:
                null == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool,
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as ChatStatsData,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatStatsDataCopyWith<$Res> get data {
    return $ChatStatsDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatStatsResponseImplCopyWith<$Res>
    implements $ChatStatsResponseCopyWith<$Res> {
  factory _$$ChatStatsResponseImplCopyWith(
    _$ChatStatsResponseImpl value,
    $Res Function(_$ChatStatsResponseImpl) then,
  ) = __$$ChatStatsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, ChatStatsData data, String? error});

  @override
  $ChatStatsDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ChatStatsResponseImplCopyWithImpl<$Res>
    extends _$ChatStatsResponseCopyWithImpl<$Res, _$ChatStatsResponseImpl>
    implements _$$ChatStatsResponseImplCopyWith<$Res> {
  __$$ChatStatsResponseImplCopyWithImpl(
    _$ChatStatsResponseImpl _value,
    $Res Function(_$ChatStatsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? error = freezed,
  }) {
    return _then(
      _$ChatStatsResponseImpl(
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        data:
            null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as ChatStatsData,
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
class _$ChatStatsResponseImpl implements _ChatStatsResponse {
  const _$ChatStatsResponseImpl({
    required this.success,
    required this.data,
    this.error,
  });

  factory _$ChatStatsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatStatsResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final ChatStatsData data;
  @override
  final String? error;

  @override
  String toString() {
    return 'ChatStatsResponse(success: $success, data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStatsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, error);

  /// Create a copy of ChatStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStatsResponseImplCopyWith<_$ChatStatsResponseImpl> get copyWith =>
      __$$ChatStatsResponseImplCopyWithImpl<_$ChatStatsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatStatsResponseImplToJson(this);
  }
}

abstract class _ChatStatsResponse implements ChatStatsResponse {
  const factory _ChatStatsResponse({
    required final bool success,
    required final ChatStatsData data,
    final String? error,
  }) = _$ChatStatsResponseImpl;

  factory _ChatStatsResponse.fromJson(Map<String, dynamic> json) =
      _$ChatStatsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  ChatStatsData get data;
  @override
  String? get error;

  /// Create a copy of ChatStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStatsResponseImplCopyWith<_$ChatStatsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  bool get isFromUser => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get conversationId => throw _privateConstructorUsedError;
  ChatTone? get tone => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
    ChatMessage value,
    $Res Function(ChatMessage) then,
  ) = _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call({
    String id,
    String text,
    bool isFromUser,
    DateTime timestamp,
    String? conversationId,
    ChatTone? tone,
    bool isLoading,
    bool hasError,
  });
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? isFromUser = null,
    Object? timestamp = null,
    Object? conversationId = freezed,
    Object? tone = freezed,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            text:
                null == text
                    ? _value.text
                    : text // ignore: cast_nullable_to_non_nullable
                        as String,
            isFromUser:
                null == isFromUser
                    ? _value.isFromUser
                    : isFromUser // ignore: cast_nullable_to_non_nullable
                        as bool,
            timestamp:
                null == timestamp
                    ? _value.timestamp
                    : timestamp // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            conversationId:
                freezed == conversationId
                    ? _value.conversationId
                    : conversationId // ignore: cast_nullable_to_non_nullable
                        as String?,
            tone:
                freezed == tone
                    ? _value.tone
                    : tone // ignore: cast_nullable_to_non_nullable
                        as ChatTone?,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            hasError:
                null == hasError
                    ? _value.hasError
                    : hasError // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
    _$ChatMessageImpl value,
    $Res Function(_$ChatMessageImpl) then,
  ) = __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String text,
    bool isFromUser,
    DateTime timestamp,
    String? conversationId,
    ChatTone? tone,
    bool isLoading,
    bool hasError,
  });
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
    _$ChatMessageImpl _value,
    $Res Function(_$ChatMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? isFromUser = null,
    Object? timestamp = null,
    Object? conversationId = freezed,
    Object? tone = freezed,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(
      _$ChatMessageImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        text:
            null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                    as String,
        isFromUser:
            null == isFromUser
                ? _value.isFromUser
                : isFromUser // ignore: cast_nullable_to_non_nullable
                    as bool,
        timestamp:
            null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        conversationId:
            freezed == conversationId
                ? _value.conversationId
                : conversationId // ignore: cast_nullable_to_non_nullable
                    as String?,
        tone:
            freezed == tone
                ? _value.tone
                : tone // ignore: cast_nullable_to_non_nullable
                    as ChatTone?,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        hasError:
            null == hasError
                ? _value.hasError
                : hasError // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl({
    required this.id,
    required this.text,
    required this.isFromUser,
    required this.timestamp,
    this.conversationId,
    this.tone,
    this.isLoading = false,
    this.hasError = false,
  });

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final bool isFromUser;
  @override
  final DateTime timestamp;
  @override
  final String? conversationId;
  @override
  final ChatTone? tone;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;

  @override
  String toString() {
    return 'ChatMessage(id: $id, text: $text, isFromUser: $isFromUser, timestamp: $timestamp, conversationId: $conversationId, tone: $tone, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isFromUser, isFromUser) ||
                other.isFromUser == isFromUser) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.tone, tone) || other.tone == tone) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    text,
    isFromUser,
    timestamp,
    conversationId,
    tone,
    isLoading,
    hasError,
  );

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(this);
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage({
    required final String id,
    required final String text,
    required final bool isFromUser,
    required final DateTime timestamp,
    final String? conversationId,
    final ChatTone? tone,
    final bool isLoading,
    final bool hasError,
  }) = _$ChatMessageImpl;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  bool get isFromUser;
  @override
  DateTime get timestamp;
  @override
  String? get conversationId;
  @override
  ChatTone? get tone;
  @override
  bool get isLoading;
  @override
  bool get hasError;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatState _$ChatStateFromJson(Map<String, dynamic> json) {
  return _ChatState.fromJson(json);
}

/// @nodoc
mixin _$ChatState {
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isTyping => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get currentConversationId => throw _privateConstructorUsedError;
  ChatStatsData? get stats => throw _privateConstructorUsedError;

  /// Serializes this ChatState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call({
    List<ChatMessage> messages,
    bool isLoading,
    bool isTyping,
    bool hasMore,
    String? error,
    String? currentConversationId,
    ChatStatsData? stats,
  });

  $ChatStatsDataCopyWith<$Res>? get stats;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isLoading = null,
    Object? isTyping = null,
    Object? hasMore = null,
    Object? error = freezed,
    Object? currentConversationId = freezed,
    Object? stats = freezed,
  }) {
    return _then(
      _value.copyWith(
            messages:
                null == messages
                    ? _value.messages
                    : messages // ignore: cast_nullable_to_non_nullable
                        as List<ChatMessage>,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isTyping:
                null == isTyping
                    ? _value.isTyping
                    : isTyping // ignore: cast_nullable_to_non_nullable
                        as bool,
            hasMore:
                null == hasMore
                    ? _value.hasMore
                    : hasMore // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
            currentConversationId:
                freezed == currentConversationId
                    ? _value.currentConversationId
                    : currentConversationId // ignore: cast_nullable_to_non_nullable
                        as String?,
            stats:
                freezed == stats
                    ? _value.stats
                    : stats // ignore: cast_nullable_to_non_nullable
                        as ChatStatsData?,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatStatsDataCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $ChatStatsDataCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
    _$ChatStateImpl value,
    $Res Function(_$ChatStateImpl) then,
  ) = __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ChatMessage> messages,
    bool isLoading,
    bool isTyping,
    bool hasMore,
    String? error,
    String? currentConversationId,
    ChatStatsData? stats,
  });

  @override
  $ChatStatsDataCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
    _$ChatStateImpl _value,
    $Res Function(_$ChatStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isLoading = null,
    Object? isTyping = null,
    Object? hasMore = null,
    Object? error = freezed,
    Object? currentConversationId = freezed,
    Object? stats = freezed,
  }) {
    return _then(
      _$ChatStateImpl(
        messages:
            null == messages
                ? _value._messages
                : messages // ignore: cast_nullable_to_non_nullable
                    as List<ChatMessage>,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isTyping:
            null == isTyping
                ? _value.isTyping
                : isTyping // ignore: cast_nullable_to_non_nullable
                    as bool,
        hasMore:
            null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
        currentConversationId:
            freezed == currentConversationId
                ? _value.currentConversationId
                : currentConversationId // ignore: cast_nullable_to_non_nullable
                    as String?,
        stats:
            freezed == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                    as ChatStatsData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl({
    final List<ChatMessage> messages = const [],
    this.isLoading = false,
    this.isTyping = false,
    this.hasMore = true,
    this.error,
    this.currentConversationId,
    this.stats,
  }) : _messages = messages;

  factory _$ChatStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatStateImplFromJson(json);

  final List<ChatMessage> _messages;
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isTyping;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  final String? error;
  @override
  final String? currentConversationId;
  @override
  final ChatStatsData? stats;

  @override
  String toString() {
    return 'ChatState(messages: $messages, isLoading: $isLoading, isTyping: $isTyping, hasMore: $hasMore, error: $error, currentConversationId: $currentConversationId, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isTyping, isTyping) ||
                other.isTyping == isTyping) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.currentConversationId, currentConversationId) ||
                other.currentConversationId == currentConversationId) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_messages),
    isLoading,
    isTyping,
    hasMore,
    error,
    currentConversationId,
    stats,
  );

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatStateImplToJson(this);
  }
}

abstract class _ChatState implements ChatState {
  const factory _ChatState({
    final List<ChatMessage> messages,
    final bool isLoading,
    final bool isTyping,
    final bool hasMore,
    final String? error,
    final String? currentConversationId,
    final ChatStatsData? stats,
  }) = _$ChatStateImpl;

  factory _ChatState.fromJson(Map<String, dynamic> json) =
      _$ChatStateImpl.fromJson;

  @override
  List<ChatMessage> get messages;
  @override
  bool get isLoading;
  @override
  bool get isTyping;
  @override
  bool get hasMore;
  @override
  String? get error;
  @override
  String? get currentConversationId;
  @override
  ChatStatsData? get stats;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
