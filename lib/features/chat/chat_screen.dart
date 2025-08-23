import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math' as math;

/// Ultra Premium Apple iOS 18 style chat screen - Absolutely mind-blowing design! 🤯✨💫
class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final messageController = useTextEditingController();
    final focusNode = useFocusNode();
    final isTyping = useState(false);
    final showSuggestions = useState(true);
    final keyboardHeight = useState(0.0);
    
    // Premium predefined questions
    final suggestions = [
      "What's my zodiac compatibility?",
      "Tell me about my numerology",
      "What do the stars say today?",
      "Calculate my life path number",
      "What's my rising sign?",
      "Moon phase meanings",
    ];
    
    // Mock messages for beautiful demo
    final messages = useState([
      ChatMessage(
        id: '1',
        text: 'Hello! I\'m your personal cosmic guide ✨ How can I help you explore the mysteries of the universe today?',
        isFromUser: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
    ]);

    // Ultra smooth scroll to bottom with Apple-like animation
    void scrollToBottom() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + 200,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
          );
        }
      });
    }

    // Track keyboard height for perfect responsive design
    useEffect(() {
      void onKeyboardChange() {
        final bottomInset = MediaQuery.of(context).viewInsets.bottom;
        keyboardHeight.value = bottomInset;
        if (bottomInset > 0) {
          showSuggestions.value = false;
          Future.delayed(const Duration(milliseconds: 150), () {
            scrollToBottom();
          });
        }
      }
      
      return null;
    }, []);

    // Perfect focus management
    useEffect(() {
      void onFocusChange() {
        if (focusNode.hasFocus) {
          showSuggestions.value = false;
          Future.delayed(const Duration(milliseconds: 200), scrollToBottom);
        }
      }
      
      focusNode.addListener(onFocusChange);
      return () => focusNode.removeListener(onFocusChange);
    }, [focusNode]);

    return Theme(
      data: Theme.of(context).copyWith(
        // Ensure proper dark theme
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: false,
        extendBody: false,
        resizeToAvoidBottomInset: true,
        appBar: _buildUltraPremiumAppBar(context),
        body: Container(
          // Solid black background - elimină orice overlay
          color: Colors.black,
          child: Column(
            children: [
              // Messages area with perfect responsive design - using full screen
              Expanded(
                child: _buildUltraPremiumMessagesArea(
                  messages.value, 
                  scrollController, 
                  suggestions, 
                  showSuggestions.value,
                  (suggestion) => _sendMessage(suggestion, messageController, messages, scrollController, showSuggestions),
                ),
              ),
              
              // Ultra premium input area with perfect keyboard handling
              _buildUltraPremiumInputArea(
                context,
                messageController,
                focusNode,
                isTyping,
                messages,
                scrollController,
                showSuggestions,
                keyboardHeight.value,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildUltraPremiumAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black, // Solid black background
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarHeight: 70, // Header mai mic
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Colors.black, // Solid black, no transparency
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5), // Padding mult mai mic sus și jos
            child: Row(
              children: [
                // Ultra premium back button cu dimensiuni mai mici
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.09),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.12),
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        CupertinoIcons.chevron_left,
                        color: Colors.white,
                        size: 20, // Icon mai mic
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(width: 16),
                
                // AI Avatar cu dimensiuni mai mici
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF667EEA),
                        Color(0xFF764BA2),
                        Color(0xFFf093fb),
                        Color(0xFFf5576c),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF667EEA).withOpacity(0.6),
                        blurRadius: 25,
                        spreadRadius: 2,
                        offset: const Offset(0, 6),
                      ),
                      BoxShadow(
                        color: const Color(0xFFf093fb).withOpacity(0.4),
                        blurRadius: 15,
                        spreadRadius: 0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    CupertinoIcons.sparkles,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                
                const SizedBox(width: 14),
                
                // Title and status with beautiful typography
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Cosmic AI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17, // Text mai mic
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.6,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 2), // Spațiu mai mic
                      Row(
                        children: [
                          Container(
                            width: 9,
                            height: 9,
                            decoration: BoxDecoration(
                              color: const Color(0xFF30D158),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF30D158).withOpacity(0.6),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Always here for you',
                            style: TextStyle(
                              color: Color(0xFF8E8E93),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Settings button mai mic
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.09),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.12),
                      width: 0.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        HapticFeedback.lightImpact();
                        // TODO: Add settings functionality
                      },
                      child: const Icon(
                        CupertinoIcons.ellipsis,
                        color: Colors.white,
                        size: 18, // Icon mai mic
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUltraPremiumMessagesArea(
    List<ChatMessage> messages, 
    ScrollController scrollController,
    List<String> suggestions,
    bool showSuggestions,
    Function(String) onSuggestionTap,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            // Top padding to avoid status bar overlap
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.04,
                vertical: 8,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final message = messages[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _UltraPremiumChatBubble(
                        message: message,
                        maxWidth: constraints.maxWidth,
                      ),
                    );
                  },
                  childCount: messages.length,
                ),
              ),
            ),
            
            // Ultra premium suggestions with perfect responsive design
            if (showSuggestions && messages.length == 1)
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  constraints.maxWidth * 0.04,
                  8,
                  constraints.maxWidth * 0.04,
                  32,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 20),
                        child: Text(
                          'Suggested questions',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 12,
                        runSpacing: 14,
                        children: suggestions.map((suggestion) {
                          return _UltraPremiumSuggestionChip(
                            text: suggestion,
                            onTap: () => onSuggestionTap(suggestion),
                            maxWidth: constraints.maxWidth,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              
            // Minimal bottom spacing
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        );
      },
    );
  }

  Widget _buildUltraPremiumInputArea(
    BuildContext context,
    TextEditingController messageController,
    FocusNode focusNode,
    ValueNotifier<bool> isTyping,
    ValueNotifier<List<ChatMessage>> messages,
    ScrollController scrollController,
    ValueNotifier<bool> showSuggestions,
    double keyboardHeight,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: double.infinity,
      color: Colors.black, // Solid black, fără gradient
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          screenWidth * 0.04,
          15,
          screenWidth * 0.04,
          5, // Aproape zero spațiu sub input
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Ultra responsive text input
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 54,
                  maxHeight: screenWidth > 400 ? 140 : 120,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(27),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.12),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.02),
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: TextField(
                  controller: messageController,
                  focusNode: focusNode,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth > 400 ? 17 : 16,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    letterSpacing: -0.2,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Ask me anything about the cosmos...',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: screenWidth > 400 ? 17 : 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.2,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: screenWidth > 400 ? 22 : 20,
                      vertical: 17,
                    ),
                  ),
                  onChanged: (text) {
                    isTyping.value = text.trim().isNotEmpty;
                  },
                  onSubmitted: (text) {
                    if (text.trim().isNotEmpty) {
                      _sendMessage(text, messageController, messages, scrollController, showSuggestions);
                    }
                  },
                ),
              ),
            ),
            
            const SizedBox(width: 14),
            
            // Absolutely gorgeous send button
            ValueListenableBuilder<bool>(
              valueListenable: isTyping,
              builder: (context, hasText, child) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOutCubic,
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: hasText
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF007AFF),
                              Color(0xFF5856D6),
                              Color(0xFF007AFF),
                            ],
                          )
                        : null,
                    color: hasText ? null : const Color(0xFF1C1C1E).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(
                      color: hasText 
                          ? Colors.transparent 
                          : Colors.white.withOpacity(0.12),
                      width: hasText ? 0 : 1.2,
                    ),
                    boxShadow: hasText
                        ? [
                            BoxShadow(
                              color: const Color(0xFF007AFF).withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 2,
                              offset: const Offset(0, 8),
                            ),
                            BoxShadow(
                              color: const Color(0xFF5856D6).withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 16,
                              offset: const Offset(0, 8),
                            ),
                          ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(27),
                      onTap: hasText
                          ? () {
                              final text = messageController.text.trim();
                              if (text.isNotEmpty) {
                                HapticFeedback.mediumImpact();
                                _sendMessage(text, messageController, messages, scrollController, showSuggestions);
                              }
                            }
                          : null,
                      child: Icon(
                        CupertinoIcons.arrow_up,
                        color: hasText ? Colors.white : Colors.white.withOpacity(0.3),
                        size: 24,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(
    String text,
    TextEditingController controller,
    ValueNotifier<List<ChatMessage>> messages,
    ScrollController scrollController,
    ValueNotifier<bool> showSuggestions,
  ) {
    HapticFeedback.lightImpact();
    
    final newMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isFromUser: true,
      timestamp: DateTime.now(),
    );

    messages.value = [...messages.value, newMessage];
    controller.clear();
    showSuggestions.value = false;

    // Ultra smooth scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
        );
      }
    });

    // Simulate AI response with realistic delay and typing indicator
    Future.delayed(const Duration(milliseconds: 1000), () {
      final aiResponse = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: _getIntelligentAIResponse(text),
        isFromUser: false,
        timestamp: DateTime.now(),
      );

      messages.value = [...messages.value, aiResponse];

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + 100,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutCubic,
          );
        }
      });
    });
  }

  String _getIntelligentAIResponse(String userMessage) {
    final lowerMessage = userMessage.toLowerCase();
    
    if (lowerMessage.contains('zodiac') || lowerMessage.contains('sign')) {
      return '✨ Your zodiac sign holds incredible cosmic energy! The stars have been aligning beautifully for your sign lately. What\'s your birth date? I can provide you with personalized insights about your celestial blueprint.';
    } else if (lowerMessage.contains('numerology') || lowerMessage.contains('number')) {
      return '🔢 Numerology reveals the hidden mathematical patterns in your life! Your life path number can unlock secrets about your destiny. Would you like me to calculate your personal numerology chart?';
    } else if (lowerMessage.contains('compatibility')) {
      return '💫 Cosmic compatibility is fascinating! The universe creates beautiful connections between souls. Tell me your sign and your partner\'s sign, and I\'ll reveal the celestial dynamics between you two.';
    } else if (lowerMessage.contains('today') || lowerMessage.contains('horoscope')) {
      return '🌟 Today\'s cosmic energy is particularly powerful! The planetary alignments are creating opportunities for growth and manifestation. Your intuition is especially heightened right now.';
    } else if (lowerMessage.contains('moon')) {
      return '� The moon\'s energy profoundly influences our emotions and intuition. Currently, the lunar phase is perfect for inner reflection and spiritual growth. Are you feeling its pull?';
    } else if (lowerMessage.contains('rising') || lowerMessage.contains('ascendant')) {
      return '🌅 Your rising sign is your cosmic mask - how the world sees you! It\'s the energy you project and your natural approach to life. I\'d need your exact birth time and location to calculate this precisely.';
    } else {
      const responses = [
        '✨ The universe is whispering beautiful secrets to me about your journey. Every question you ask opens new doorways to cosmic understanding.',
        '🌟 What a profound inquiry! The celestial energies are swirling around your curiosity, ready to reveal deeper truths about your path.',
        '💫 I sense powerful spiritual energy in your question. The cosmos is eager to share its wisdom with someone as open as you are.',
        '🔮 Your soul is seeking answers that the stars are ready to provide. Let me divine the cosmic guidance meant specifically for you.',
        '🌙 The mystical forces are particularly strong right now. Your timing for this question is absolutely perfect - the universe is listening.',
      ];
      
      return responses[DateTime.now().millisecond % responses.length];
    }
  }
}

class _UltraPremiumChatBubble extends StatelessWidget {
  final ChatMessage message;
  final double maxWidth;

  const _UltraPremiumChatBubble({
    required this.message, 
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.isFromUser;
    final bubbleWidth = maxWidth * 0.8;
    
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: bubbleWidth,
          minWidth: bubbleWidth * 0.3,
        ),
        child: Column(
          crossAxisAlignment: isUser 
              ? CrossAxisAlignment.end 
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: maxWidth > 400 ? 22 : 20,
                vertical: maxWidth > 400 ? 18 : 16,
              ),
              decoration: BoxDecoration(
                gradient: isUser
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF007AFF),
                          Color(0xFF5856D6),
                          Color(0xFF007AFF),
                        ],
                      )
                    : null,
                color: isUser 
                    ? null 
                    : const Color(0xFF1C1C1E).withOpacity(0.9),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(26),
                  topRight: const Radius.circular(26),
                  bottomLeft: Radius.circular(isUser ? 26 : 8),
                  bottomRight: Radius.circular(isUser ? 8 : 26),
                ),
                border: Border.all(
                  color: isUser 
                      ? Colors.transparent 
                      : Colors.white.withOpacity(0.08),
                  width: isUser ? 0 : 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isUser 
                        ? const Color(0xFF007AFF).withOpacity(0.3)
                        : Colors.black.withOpacity(0.3),
                    blurRadius: isUser ? 16 : 12,
                    offset: const Offset(0, 6),
                  ),
                  if (isUser)
                    BoxShadow(
                      color: const Color(0xFF5856D6).withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: maxWidth > 400 ? 17 : 16,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  letterSpacing: -0.2,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _formatTime(message.timestamp),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: maxWidth > 400 ? 13 : 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) {
      return 'Now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    }
  }
}

class _UltraPremiumSuggestionChip extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double maxWidth;

  const _UltraPremiumSuggestionChip({
    required this.text,
    required this.onTap,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth * 0.7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E).withOpacity(0.8),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withOpacity(0.12),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.02),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () {
            HapticFeedback.mediumImpact();
            onTap();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: maxWidth > 400 ? 18 : 16,
              vertical: maxWidth > 400 ? 14 : 12,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: maxWidth > 400 ? 16 : 15,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatMessage {
  final String id;
  final String text;
  final bool isFromUser;
  final DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.text,
    required this.isFromUser,
    required this.timestamp,
  });
}
