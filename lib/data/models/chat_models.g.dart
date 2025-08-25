// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageRequestImpl _$$ChatMessageRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ChatMessageRequestImpl(
  message: json['message'] as String,
  tone:
      $enumDecodeNullable(_$ChatToneEnumMap, json['tone']) ?? ChatTone.mystical,
);

Map<String, dynamic> _$$ChatMessageRequestImplToJson(
  _$ChatMessageRequestImpl instance,
) => <String, dynamic>{
  'message': instance.message,
  'tone': _$ChatToneEnumMap[instance.tone]!,
};

const _$ChatToneEnumMap = {
  ChatTone.friendly: 'friendly',
  ChatTone.professional: 'professional',
  ChatTone.mystical: 'mystical',
  ChatTone.casual: 'casual',
};

_$ChatMessageDataImpl _$$ChatMessageDataImplFromJson(
  Map<String, dynamic> json,
) => _$ChatMessageDataImpl(
  response: json['response'] as String,
  conversationId: json['conversationId'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$$ChatMessageDataImplToJson(
  _$ChatMessageDataImpl instance,
) => <String, dynamic>{
  'response': instance.response,
  'conversationId': instance.conversationId,
  'timestamp': instance.timestamp.toIso8601String(),
};

_$ChatMessageResponseImpl _$$ChatMessageResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ChatMessageResponseImpl(
  success: json['success'] as bool,
  data: ChatMessageData.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] as String?,
);

Map<String, dynamic> _$$ChatMessageResponseImplToJson(
  _$ChatMessageResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
};

_$ChatConversationImpl _$$ChatConversationImplFromJson(
  Map<String, dynamic> json,
) => _$ChatConversationImpl(
  id: json['id'] as String,
  lastMessage: json['lastMessage'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  messageCount: (json['messageCount'] as num).toInt(),
);

Map<String, dynamic> _$$ChatConversationImplToJson(
  _$ChatConversationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'lastMessage': instance.lastMessage,
  'timestamp': instance.timestamp.toIso8601String(),
  'messageCount': instance.messageCount,
};

_$ChatHistoryDataImpl _$$ChatHistoryDataImplFromJson(
  Map<String, dynamic> json,
) => _$ChatHistoryDataImpl(
  conversations:
      (json['conversations'] as List<dynamic>)
          .map((e) => ChatConversation.fromJson(e as Map<String, dynamic>))
          .toList(),
  total: (json['total'] as num).toInt(),
  hasMore: json['hasMore'] as bool,
);

Map<String, dynamic> _$$ChatHistoryDataImplToJson(
  _$ChatHistoryDataImpl instance,
) => <String, dynamic>{
  'conversations': instance.conversations,
  'total': instance.total,
  'hasMore': instance.hasMore,
};

_$ChatHistoryResponseImpl _$$ChatHistoryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ChatHistoryResponseImpl(
  success: json['success'] as bool,
  data: ChatHistoryData.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] as String?,
);

Map<String, dynamic> _$$ChatHistoryResponseImplToJson(
  _$ChatHistoryResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
};

_$ChatStatsDataImpl _$$ChatStatsDataImplFromJson(Map<String, dynamic> json) =>
    _$ChatStatsDataImpl(
      totalMessages: (json['totalMessages'] as num).toInt(),
      todayMessages: (json['todayMessages'] as num).toInt(),
      remainingToday: (json['remainingToday'] as num).toInt(),
    );

Map<String, dynamic> _$$ChatStatsDataImplToJson(_$ChatStatsDataImpl instance) =>
    <String, dynamic>{
      'totalMessages': instance.totalMessages,
      'todayMessages': instance.todayMessages,
      'remainingToday': instance.remainingToday,
    };

_$ChatStatsResponseImpl _$$ChatStatsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ChatStatsResponseImpl(
  success: json['success'] as bool,
  data: ChatStatsData.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] as String?,
);

Map<String, dynamic> _$$ChatStatsResponseImplToJson(
  _$ChatStatsResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'data': instance.data,
  'error': instance.error,
};

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: json['id'] as String,
      text: json['text'] as String,
      isFromUser: json['isFromUser'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
      conversationId: json['conversationId'] as String?,
      tone: $enumDecodeNullable(_$ChatToneEnumMap, json['tone']),
      isLoading: json['isLoading'] as bool? ?? false,
      hasError: json['hasError'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'isFromUser': instance.isFromUser,
      'timestamp': instance.timestamp.toIso8601String(),
      'conversationId': instance.conversationId,
      'tone': _$ChatToneEnumMap[instance.tone],
      'isLoading': instance.isLoading,
      'hasError': instance.hasError,
    };

_$ChatStateImpl _$$ChatStateImplFromJson(Map<String, dynamic> json) =>
    _$ChatStateImpl(
      messages:
          (json['messages'] as List<dynamic>?)
              ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
      isTyping: json['isTyping'] as bool? ?? false,
      hasMore: json['hasMore'] as bool? ?? true,
      error: json['error'] as String?,
      currentConversationId: json['currentConversationId'] as String?,
      stats:
          json['stats'] == null
              ? null
              : ChatStatsData.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatStateImplToJson(_$ChatStateImpl instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'isLoading': instance.isLoading,
      'isTyping': instance.isTyping,
      'hasMore': instance.hasMore,
      'error': instance.error,
      'currentConversationId': instance.currentConversationId,
      'stats': instance.stats,
    };
