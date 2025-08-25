import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_models.freezed.dart';
part 'chat_models.g.dart';

/// Chat message tone options
enum ChatTone {
  @JsonValue('friendly')
  friendly,
  @JsonValue('professional')
  professional,
  @JsonValue('mystical')
  mystical,
  @JsonValue('casual')
  casual,
}

/// Chat message request model
@freezed
class ChatMessageRequest with _$ChatMessageRequest {
  const factory ChatMessageRequest({
    required String message,
    @Default(ChatTone.mystical) ChatTone tone,
  }) = _ChatMessageRequest;

  factory ChatMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageRequestFromJson(json);
}

/// Chat message response data
@freezed
class ChatMessageData with _$ChatMessageData {
  const factory ChatMessageData({
    required String response,
    required String conversationId,
    required DateTime timestamp,
  }) = _ChatMessageData;

  factory ChatMessageData.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageDataFromJson(json);
}

/// Chat message response wrapper
@freezed
class ChatMessageResponse with _$ChatMessageResponse {
  const factory ChatMessageResponse({
    required bool success,
    required ChatMessageData data,
    String? error,
  }) = _ChatMessageResponse;

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);
}

/// Chat conversation model
@freezed
class ChatConversation with _$ChatConversation {
  const factory ChatConversation({
    required String id,
    required String lastMessage,
    required DateTime timestamp,
    required int messageCount,
  }) = _ChatConversation;

  factory ChatConversation.fromJson(Map<String, dynamic> json) =>
      _$ChatConversationFromJson(json);
}

/// Chat history response data
@freezed
class ChatHistoryData with _$ChatHistoryData {
  const factory ChatHistoryData({
    required List<ChatConversation> conversations,
    required int total,
    required bool hasMore,
  }) = _ChatHistoryData;

  factory ChatHistoryData.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryDataFromJson(json);
}

/// Chat history response wrapper
@freezed
class ChatHistoryResponse with _$ChatHistoryResponse {
  const factory ChatHistoryResponse({
    required bool success,
    required ChatHistoryData data,
    String? error,
  }) = _ChatHistoryResponse;

  factory ChatHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryResponseFromJson(json);
}

/// Chat stats data
@freezed
class ChatStatsData with _$ChatStatsData {
  const factory ChatStatsData({
    required int totalMessages,
    required int todayMessages,
    required int remainingToday,
  }) = _ChatStatsData;

  factory ChatStatsData.fromJson(Map<String, dynamic> json) =>
      _$ChatStatsDataFromJson(json);
}

/// Chat stats response wrapper
@freezed
class ChatStatsResponse with _$ChatStatsResponse {
  const factory ChatStatsResponse({
    required bool success,
    required ChatStatsData data,
    String? error,
  }) = _ChatStatsResponse;

  factory ChatStatsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatStatsResponseFromJson(json);
}

/// Local chat message model for UI
@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String text,
    required bool isFromUser,
    required DateTime timestamp,
    String? conversationId,
    ChatTone? tone,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

/// Chat state for UI management
@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isLoading,
    @Default(false) bool isTyping,
    @Default(true) bool hasMore,
    String? error,
    String? currentConversationId,
    ChatStatsData? stats,
  }) = _ChatState;

  factory ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);
}
