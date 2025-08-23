import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../config/app_colors.dart';
import '../../core/services/haptics_service.dart';

class FirstTarotDrawScreen extends ConsumerStatefulWidget {
  const FirstTarotDrawScreen({super.key});

  @override
  ConsumerState<FirstTarotDrawScreen> createState() =>
      _FirstTarotDrawScreenState();
}

class _FirstTarotDrawScreenState extends ConsumerState<FirstTarotDrawScreen>
    with TickerProviderStateMixin {
  late AnimationController _starsController;
  late AnimationController _pulseController;
  late AnimationController _flipController;

  List<bool> _cardFlipped = [false, false, false];
  int? _selectedCardIndex;
  Map<String, dynamic>? _drawnCard;
  bool _isLoading = false;
  bool _cardDrawn = false;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _starsController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _flipController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _starsController.dispose();
    _pulseController.dispose();
    _flipController.dispose();
    super.dispose();
  }

  Future<void> _drawCard(int cardIndex) async {
    if (_cardDrawn) return;

    setState(() {
      _selectedCardIndex = cardIndex;
      _isLoading = true;
    });

    try {
      HapticsService.mediumImpact();

      // Flip animation
      await _flipController.forward();

      setState(() {
        _cardFlipped[cardIndex] = true;
      });

      // Mock tarot card draw for onboarding
      final mockCards = [
        "The Star - Hope and inspiration guide your path forward.",
        "The Sun - Success and joy illuminate your journey.",
        "The Moon - Trust your intuition during times of uncertainty.",
      ];

      setState(() {
        _drawnCard = {
          'name': mockCards[cardIndex % mockCards.length],
          'description': 'Your first tarot guidance for this journey.',
          'image_url': 'assets/images/tarot_placeholder.png',
        };
        _cardDrawn = true;
        _isLoading = false;
      });

      HapticsService.heavyImpact();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      // Show mock card for demo purposes
      setState(() {
        _drawnCard = {
          'name': 'The Star',
          'shortMeaning':
              'Hope, inspiration, and spiritual guidance await you on your journey.',
          'imageUrl': 'https://example.com/star.jpg',
        };
        _cardDrawn = true;
      });

      HapticsService.heavyImpact();
    }
  }

  void _navigateToNext() {
    HapticsService.lightImpact();
    context.go('/onboarding/daily-promise');
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.getBackgroundGradient(isDarkMode),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                // Header with back button
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        HapticsService.lightImpact();
                        context.go('/onboarding/intent');
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '3 of 5',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                if (!_cardDrawn) ...[
                  // Initial state - card selection
                  Text(
                    'Choose Your\nGuiding Card',
                    style: const TextStyle(
                      fontFamily: 'Playfair Display',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      height: 1.2,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Trust your intuition and select the card that calls to you',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: const Color(0xFFF5F5F5),
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const Spacer(),

                  // Three cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) {
                      return _buildTarotCard(index);
                    }),
                  ),

                  const Spacer(),
                ] else ...[
                  // Card drawn - show result
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your Guiding Card',
                          style: const TextStyle(
                            fontFamily: 'Playfair Display',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 40),

                        // Card result
                        Container(
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: AppColors.ctaPrimary,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 30,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                color: Colors.white,
                                size: 60,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                _drawnCard?['name'] ?? 'The Star',
                                style: const TextStyle(
                                  fontFamily: 'Playfair Display',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.1),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            _drawnCard?['shortMeaning'] ??
                                'Hope, inspiration, and spiritual guidance await you on your journey.',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: const Color(0xFFF5F5F5),
                              fontSize: 16,
                              height: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],

                // Continue button
                Container(
                  width: double.infinity,
                  height: 56,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    onPressed: _cardDrawn ? _navigateToNext : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _cardDrawn
                              ? Colors.white.withOpacity(0.15)
                              : Colors.white.withOpacity(0.05),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(
                      _cardDrawn ? 'Continue' : 'Choose a card first',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
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

  Widget _buildTarotCard(int index) {
    final isSelected = _selectedCardIndex == index;
    final isFlipped = _cardFlipped[index];

    return GestureDetector(
      onTap: () => _drawCard(index),
      child: AnimatedBuilder(
        animation: _flipController,
        builder: (context, child) {
          final isShowingBack = _flipController.value < 0.5;

          return Transform(
            alignment: Alignment.center,
            transform:
                Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(isSelected && !isShowingBack ? pi : 0),
            child: Container(
              width: 80,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient:
                    isFlipped
                        ? AppColors.ctaPrimary
                        : LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.1),
                          ],
                        ),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child:
                  _isLoading && isSelected
                      ? const Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                      : isFlipped
                      ? const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 30,
                      )
                      : Center(
                        child: Container(
                          width: 40,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Icon(
                            Icons.help_outline,
                            color: Colors.white.withOpacity(0.5),
                            size: 20,
                          ),
                        ),
                      ),
            ),
          );
        },
      ),
    );
  }
}
