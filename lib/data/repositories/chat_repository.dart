import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/chat_models.dart';
import '../services/chat_service.dart';

/// Enterprise-grade chat repository with business logic and caching
class ChatRepository {
  final ChatService _chatService;
  
  // Local state management
  final List<ChatMessage> _messages = [];
  String? _currentConversationId;
  
  ChatRepository(this._chatService);

  /// Get all messages in current conversation
  List<ChatMessage> get messages => List.unmodifiable(_messages);
  
  /// Get current conversation ID
  String? get currentConversationId => _currentConversationId;
  
  /// Send a message and add both user message and AI response to conversation
  Future<ChatMessage> sendMessage({
    required String messageText,
    ChatTone tone = ChatTone.mystical,
  }) async {
    try {
      // Create user message
      final userMessage = ChatMessage(
        id: _generateMessageId(),
        text: messageText,
        isFromUser: true,
        timestamp: DateTime.now(),
        conversationId: _currentConversationId,
        tone: tone,
      );
      
      // Add user message to local state
      _messages.add(userMessage);
      
      // Create loading AI message
      final loadingMessage = ChatMessage(
        id: _generateMessageId(),
        text: '',
        isFromUser: false,
        timestamp: DateTime.now(),
        conversationId: _currentConversationId,
        isLoading: true,
      );
      
      // Add loading message to local state
      _messages.add(loadingMessage);
      
      debugPrint('💬 Sending message: $messageText');
      debugPrint('🎭 Using tone: ${tone.name}');
      
      // Send to API
      final response = await _chatService.sendMessage(
        ChatMessageRequest(
          message: messageText,
          tone: tone,
        ),
      );
      
      // Remove loading message
      _messages.removeWhere((msg) => msg.id == loadingMessage.id);
      
      // Update conversation ID if this is a new conversation
      if (_currentConversationId == null) {
        _currentConversationId = response.data.conversationId;
        debugPrint('🆕 New conversation started: $_currentConversationId');
      }
      
      // Create AI response message
      final aiMessage = ChatMessage(
        id: _generateMessageId(),
        text: response.data.response,
        isFromUser: false,
        timestamp: response.data.timestamp,
        conversationId: response.data.conversationId,
      );
      
      // Add AI message to local state
      _messages.add(aiMessage);
      
      debugPrint('✅ AI response received: ${aiMessage.text.substring(0, 50)}...');
      
      return aiMessage;
      
    } catch (e) {
      debugPrint('❌ Error sending message: $e');
      
      // Remove loading message if it exists
      _messages.removeWhere((msg) => msg.isLoading);
      
      // Add error message
      final errorMessage = ChatMessage(
        id: _generateMessageId(),
        text: _getErrorMessage(e),
        isFromUser: false,
        timestamp: DateTime.now(),
        conversationId: _currentConversationId,
        hasError: true,
      );
      
      _messages.add(errorMessage);
      
      rethrow;
    }
  }
  
  /// Load conversation history
  Future<List<ChatConversation>> loadHistory({
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      debugPrint('📚 Loading chat history: limit=$limit, offset=$offset');
      
      final response = await _chatService.getHistory(
        limit: limit,
        offset: offset,
      );
      
      debugPrint('✅ Loaded ${response.data.conversations.length} conversations');
      
      return response.data.conversations;
      
    } catch (e) {
      debugPrint('❌ Error loading history: $e');
      rethrow;
    }
  }
  
  /// Get chat statistics
  Future<ChatStatsData> getStats() async {
    try {
      debugPrint('📊 Loading chat stats');
      
      final response = await _chatService.getStats();
      
      debugPrint('✅ Stats loaded: ${response.data.totalMessages} total messages');
      
      return response.data;
      
    } catch (e) {
      debugPrint('❌ Error loading stats: $e');
      rethrow;
    }
  }
  
  /// Start a new conversation
  void startNewConversation() {
    _currentConversationId = null;
    _messages.clear();
    debugPrint('🆕 Started new conversation');
  }
  
  /// Load an existing conversation
  Future<void> loadConversation(String conversationId) async {
    try {
      _currentConversationId = conversationId;
      _messages.clear();
      
      // In a real app, you'd load messages for this conversation
      // For now, we'll just set the conversation ID
      debugPrint('📖 Loaded conversation: $conversationId');
      
    } catch (e) {
      debugPrint('❌ Error loading conversation: $e');
      rethrow;
    }
  }
  
  /// Clear local cache
  void clearCache() {
    _chatService.clearCache();
    debugPrint('🧹 Chat repository cache cleared');
  }
  
  /// Generate unique message ID
  String _generateMessageId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
  
  /// Get user-friendly error message
  String _getErrorMessage(dynamic error) {
    if (error is ChatException) {
      return error.message;
    }
    
    return 'Something went wrong. Please try again.';
  }
}

/// Provider for chat repository
final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final chatService = ref.watch(chatServiceProvider);
  return ChatRepository(chatService);
});
