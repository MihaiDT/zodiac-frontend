import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/models/chat_models.dart';
import '../../../data/repositories/chat_repository.dart';

/// Notifier for chat state management
class ChatNotifier extends StateNotifier<ChatState> {
  final ChatRepository _repository;
  
  ChatNotifier(this._repository) : super(const ChatState()) {
    _initialize();
  }
  
  /// Initialize chat state
  Future<void> _initialize() async {
    try {
      // Load initial stats
      await loadStats();
      
      // Load recent messages if any
      await _loadRecentConversation();
      
    } catch (e) {
      debugPrint('❌ Error initializing chat: $e');
      state = state.copyWith(
        error: 'Failed to initialize chat: ${e.toString()}',
        isLoading: false,
      );
    }
  }
  
  /// Send a message
  Future<void> sendMessage({
    required String message,
    ChatTone tone = ChatTone.mystical,
  }) async {
    if (message.trim().isEmpty) return;
    
    try {
      // Set typing state
      state = state.copyWith(
        isTyping: true,
        error: null,
      );
      
      // Add user message immediately to UI
      final userMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: message.trim(),
        isFromUser: true,
        timestamp: DateTime.now(),
        conversationId: state.currentConversationId,
        tone: tone,
      );
      
      final updatedMessages = [...state.messages, userMessage];
      
      // Add loading message for AI response
      final loadingMessage = ChatMessage(
        id: '${DateTime.now().millisecondsSinceEpoch}_loading',
        text: '',
        isFromUser: false,
        timestamp: DateTime.now(),
        isLoading: true,
      );
      
      state = state.copyWith(
        messages: [...updatedMessages, loadingMessage],
        isTyping: true,
      );
      
      debugPrint('💬 Sending message to repository: $message');
      
      // Send message through repository
      final aiMessage = await _repository.sendMessage(
        messageText: message.trim(),
        tone: tone,
      );
      
      // Remove loading message and add AI response
      final finalMessages = updatedMessages.where((msg) => !msg.isLoading).toList();
      finalMessages.add(aiMessage);
      
      // Update state with new conversation ID if available
      final newConversationId = state.currentConversationId ?? _repository.currentConversationId;
      
      state = state.copyWith(
        messages: finalMessages,
        isTyping: false,
        currentConversationId: newConversationId,
        error: null,
      );
      
      // Refresh stats after successful message
      await loadStats();
      
      debugPrint('✅ Message sent successfully');
      
    } catch (e) {
      debugPrint('❌ Error sending message: $e');
      
      // Remove loading message and show error
      final messagesWithoutLoading = state.messages.where((msg) => !msg.isLoading).toList();
      
      // Add error message
      final errorMessage = ChatMessage(
        id: '${DateTime.now().millisecondsSinceEpoch}_error',
        text: _getErrorMessage(e),
        isFromUser: false,
        timestamp: DateTime.now(),
        hasError: true,
      );
      
      state = state.copyWith(
        messages: [...messagesWithoutLoading, errorMessage],
        isTyping: false,
        error: e.toString(),
      );
    }
  }
  
  /// Load chat statistics
  Future<void> loadStats() async {
    try {
      debugPrint('📊 Loading chat stats');
      
      final stats = await _repository.getStats();
      
      state = state.copyWith(
        stats: stats,
      );
      
      debugPrint('✅ Stats loaded: ${stats.totalMessages} total messages');
      
    } catch (e) {
      debugPrint('❌ Error loading stats: $e');
      // Don't update error state for stats loading failure
    }
  }
  
  /// Start a new conversation
  void startNewConversation() {
    _repository.startNewConversation();
    
    state = state.copyWith(
      messages: [],
      currentConversationId: null,
      error: null,
    );
    
    debugPrint('🆕 Started new conversation');
  }
  
  /// Load conversation history
  Future<List<ChatConversation>> loadHistory({
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      debugPrint('📚 Loading conversation history');
      
      return await _repository.loadHistory(
        limit: limit,
        offset: offset,
      );
      
    } catch (e) {
      debugPrint('❌ Error loading history: $e');
      rethrow;
    }
  }
  
  /// Clear error state
  void clearError() {
    state = state.copyWith(error: null);
  }
  
  /// Retry last failed message
  Future<void> retryLastMessage() async {
    final lastUserMessage = state.messages
        .where((msg) => msg.isFromUser)
        .lastOrNull;
    
    if (lastUserMessage != null) {
      // Remove error messages
      final messagesWithoutErrors = state.messages
          .where((msg) => !msg.hasError)
          .toList();
      
      state = state.copyWith(
        messages: messagesWithoutErrors,
        error: null,
      );
      
      // Resend the message
      await sendMessage(
        message: lastUserMessage.text,
        tone: lastUserMessage.tone ?? ChatTone.mystical,
      );
    }
  }
  
  /// Clear chat cache
  void clearCache() {
    _repository.clearCache();
    debugPrint('🧹 Chat cache cleared');
  }
  
  /// Load recent conversation if available
  Future<void> _loadRecentConversation() async {
    try {
      final history = await _repository.loadHistory(limit: 1);
      
      if (history.isNotEmpty) {
        final recentConversation = history.first;
        state = state.copyWith(
          currentConversationId: recentConversation.id,
        );
        
        debugPrint('📖 Loaded recent conversation: ${recentConversation.id}');
      }
      
    } catch (e) {
      debugPrint('❌ Error loading recent conversation: $e');
      // Don't fail initialization for this
    }
  }
  
  /// Get user-friendly error message
  String _getErrorMessage(dynamic error) {
    if (error.toString().contains('ChatException')) {
      return error.toString().replaceFirst('ChatException: ', '');
    }
    
    if (error.toString().contains('Authentication')) {
      return 'Please log in to continue chatting.';
    }
    
    if (error.toString().contains('network') || error.toString().contains('connection')) {
      return 'Connection error. Please check your internet connection.';
    }
    
    return 'Something went wrong. Please try again.';
  }
}

/// Provider for chat state
final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  return ChatNotifier(repository);
});

/// Provider for chat messages
final chatMessagesProvider = Provider<List<ChatMessage>>((ref) {
  return ref.watch(chatProvider).messages;
});

/// Provider for chat stats
final chatStatsProvider = Provider<ChatStatsData?>((ref) {
  return ref.watch(chatProvider).stats;
});

/// Provider for typing state
final isTypingProvider = Provider<bool>((ref) {
  return ref.watch(chatProvider).isTyping;
});

/// Provider for chat error
final chatErrorProvider = Provider<String?>((ref) {
  return ref.watch(chatProvider).error;
});
