import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import '../../config/app_colors.dart';
import '../../core/services/haptics_service.dart';
import '../../data/models/chat_models.dart';
import 'providers/chat_provider.dart';
import '../auth/providers/auth_controller.dart';

/// Ultra Premium Apple iOS 18 style chat screen - Clean minimal design!
class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final messageController = useTextEditingController();
    final focusNode = useFocusNode();
    final keyboardHeight = useState(0.0);
    
    // Watch chat state from providers
    final chatState = ref.watch(chatProvider);
    final messages = ref.watch(chatMessagesProvider);
    final isTyping = ref.watch(isTypingProvider);
    final chatError = ref.watch(chatErrorProvider);
    final stats = ref.watch(chatStatsProvider);
    
    // Premium predefined questions with proper tones
    final suggestions = [
      {"text": "What's my zodiac compatibility?", "tone": ChatTone.mystical},
      {"text": "Tell me about my numerology", "tone": ChatTone.professional},
      {"text": "What do the stars say today?", "tone": ChatTone.friendly},
      {"text": "Calculate my life path number", "tone": ChatTone.professional},
      {"text": "What's my rising sign?", "tone": ChatTone.mystical},
      {"text": "Moon phase meanings", "tone": ChatTone.casual},
    ];
    
    final showSuggestions = useState(messages.isEmpty);

    // Show authentication dialog function
    void showAuthDialog({required bool isLogin}) {
      final emailController = TextEditingController();
      final passwordController = TextEditingController();
      final nameController = TextEditingController();

      Widget buildTextField(TextEditingController controller, String hint, IconData icon, {bool isPassword = false}) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[800]?.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.7)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        );
      }

      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[900]?.withOpacity(0.95),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isLogin ? 'Login' : 'Register',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Name field (only for register)
                if (!isLogin) ...[
                  buildTextField(nameController, 'Name', Icons.person),
                  const SizedBox(height: 16),
                ],
                
                // Email field
                buildTextField(emailController, 'Email', Icons.email),
                const SizedBox(height: 16),
                
                // Password field
                buildTextField(passwordController, 'Password', Icons.lock, isPassword: true),
                const SizedBox(height: 24),
                
                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final authController = ref.read(authControllerProvider.notifier);
                          
                          try {
                            if (isLogin) {
                              await authController.login(
                                emailController.text.trim(),
                                passwordController.text,
                              );
                            } else {
                              await authController.register(
                                email: emailController.text.trim(),
                                password: passwordController.text,
                                name: nameController.text.trim(),
                              );
                            }
                            
                            if (context.mounted) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(isLogin ? 'Login successful!' : 'Registration successful!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error: ${e.toString()}'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isLogin ? Colors.blue : Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          isLogin ? 'Login' : 'Register',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

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

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Clean minimal header with auth options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Expanded(
                    child: Text(
                      'Cosmic AI',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Login button
                  TextButton(
                    onPressed: () => showAuthDialog(isLogin: true),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.blue.withOpacity(0.3)),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Register button
                  TextButton(
                    onPressed: () => showAuthDialog(isLogin: false),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green.withOpacity(0.2),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.green.withOpacity(0.3)),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Messages area
            Expanded(
              child: _buildUltraPremiumMessagesArea(
                messages, 
                scrollController, 
                suggestions, 
                showSuggestions.value,
                chatError,
                chatState,
                (suggestion) => _sendMessage(suggestion, messageController, scrollController, showSuggestions, ref),
                ref,
              ),
            ),
            
            // Input area
            _buildUltraPremiumInputArea(
              context,
              messageController,
              focusNode,
              scrollController,
              showSuggestions,
              keyboardHeight.value,
              ref,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUltraPremiumMessagesArea(
    List<ChatMessage> messages, 
    ScrollController scrollController,
    List<Map<String, dynamic>> suggestions,
    bool showSuggestions,
    String? chatError,
    ChatState chatState,
    Function(dynamic) onSuggestionTap,
    WidgetRef ref,
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
            
            // Error display
            if (chatError != null)
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          chatError,
                          style: const TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ),
                      TextButton(
                        onPressed: () => ref.read(chatProvider.notifier).clearError(),
                        child: const Text('Dismiss', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ),
              ),
            
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.04,
                vertical: 8,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // Filter out loading messages from the main chat view
                    final visibleMessages = messages.where((msg) => !msg.isLoading).toList();
                    final message = visibleMessages[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0, 20 * (1 - value)),
                            child: Opacity(
                              opacity: value,
                              child: _UltraPremiumChatBubble(
                                message: message,
                                maxWidth: constraints.maxWidth,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  childCount: messages.where((msg) => !msg.isLoading).length,
                ),
              ),
            ),
            
            // Ultra premium loading indicator with smooth typing animation
            // Shows when there's a loading message in the messages list
            if (messages.any((msg) => msg.isLoading))
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      const _CosmicTypingAnimation(),
                    ],
                  ),
                ),
              ),
            
            // Ultra premium suggestions with perfect responsive design
            if (showSuggestions && messages.isEmpty)
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
                          final text = suggestion['text'] as String;
                          return _UltraPremiumSuggestionChip(
                            text: text,
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
    ScrollController scrollController,
    ValueNotifier<bool> showSuggestions,
    double keyboardHeight,
    WidgetRef ref,
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    // isTyping state is now managed by provider
                  },
                  onSubmitted: (text) {
                    if (text.trim().isNotEmpty) {
                      _sendMessage(text, messageController, scrollController, showSuggestions, ref);
                    }
                  },
                ),
              ),
            ),
            
            const SizedBox(width: 14),
            
            // Absolutely gorgeous send button
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: messageController,
              builder: (context, value, child) {
                final hasText = value.text.trim().isNotEmpty;
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
                              print('🚨 SEND BUTTON TAPPED');
                              final text = messageController.text.trim();
                              print('🚨 TEXT TO SEND: "$text"');
                              if (text.isNotEmpty) {
                                HapticFeedback.mediumImpact();
                                _sendMessage(text, messageController, scrollController, showSuggestions, ref);
                              } else {
                                print('🚨 TEXT IS EMPTY');
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
    dynamic suggestion,
    TextEditingController controller,
    ScrollController scrollController,
    ValueNotifier<bool> showSuggestions,
    WidgetRef ref,
  ) async {
    print('🔥🔥🔥 _sendMessage FUNCTION CALLED!');
    debugPrint('🔥 _sendMessage called with: $suggestion');
    HapticFeedback.lightImpact();
    
    String text;
    ChatTone tone = ChatTone.friendly;
    
    // Handle both string suggestions and map suggestions with tone
    if (suggestion is Map<String, dynamic>) {
      text = suggestion['text'] as String;
      tone = suggestion['tone'] as ChatTone;
    } else {
      text = suggestion.toString();
    }
    
    controller.clear();
    showSuggestions.value = false;

    debugPrint('🚀 About to send message via provider: $text with tone: $tone');

    // Send message via provider
    await ref.read(chatProvider.notifier).sendMessage(
      message: text,
      tone: tone,
    );

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

/// Ultra premium cosmic typing animation with floating dots
class _CosmicTypingAnimation extends StatefulWidget {
  const _CosmicTypingAnimation({Key? key}) : super(key: key);

  @override
  State<_CosmicTypingAnimation> createState() => _CosmicTypingAnimationState();
}

class _CosmicTypingAnimationState extends State<_CosmicTypingAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    
    // Create three controllers for smooth wave animation
    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Create smooth, subtle animations (like professional loading dots)
    _animation1 = Tween<double>(begin: 0.0, end: -4.0).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),
    );
    _animation2 = Tween<double>(begin: 0.0, end: -4.0).animate(
      CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
    );
    _animation3 = Tween<double>(begin: 0.0, end: -4.0).animate(
      CurvedAnimation(parent: _controller3, curve: Curves.easeInOut),
    );

    // Start staggered animation
    _startAnimation();
  }

  void _startAnimation() async {
    while (mounted) {
      // Sequential wave: A 2-A (MIDDLE dot - controller2)
      if (mounted) {
        await _controller2.forward();
        await _controller2.reverse();
      }
      
      // Smooth pause before next dot
      await Future.delayed(const Duration(milliseconds: 150));
      
      // A 3-A (RIGHT dot - controller3)
      if (mounted) {
        await _controller3.forward();
        await _controller3.reverse();
      }
      
      // Smooth pause before next dot
      await Future.delayed(const Duration(milliseconds: 150));
      
      // PRIMA (LEFT dot - controller1)
      if (mounted) {
        await _controller1.forward();
        await _controller1.reverse();
      }
      
      // Longer pause before restarting the wave for smoother flow
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // First dot
        AnimatedBuilder(
          animation: _animation1,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -6 * _animation1.value),
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 6),
        
        // Second dot
        AnimatedBuilder(
          animation: _animation2,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -6 * _animation2.value),
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 6),
        
        // Third dot
        AnimatedBuilder(
          animation: _animation3,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -6 * _animation3.value),
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
