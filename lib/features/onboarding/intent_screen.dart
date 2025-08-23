import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../config/app_colors.dart';
import '../../core/services/haptics_service.dart';
import '../../core/models/onboarding_models.dart';
import 'providers/onboarding_provider.dart';

class IntentScreen extends ConsumerStatefulWidget {
  const IntentScreen({super.key});

  @override
  ConsumerState<IntentScreen> createState() => _IntentScreenState();
}

class _IntentScreenState extends ConsumerState<IntentScreen>
    with TickerProviderStateMixin {
  late AnimationController _starsController;
  late AnimationController _pulseController;

  final List<String> _selectedIntents = [];
  bool _isLoading = false;

  final List<Map<String, dynamic>> _intents = [
    {
      'id': 'love',
      'title': 'Love & Relationships',
      'description':
          'Discover your romantic compatibility and relationship insights',
      'icon': Icons.favorite,
      'gradient': [Color(0xFFFF6B9D), Color(0xFFC44569)],
    },
    {
      'id': 'abundance',
      'title': 'Wealth & Abundance',
      'description': 'Unlock opportunities for financial growth and prosperity',
      'icon': Icons.monetization_on,
      'gradient': [Color(0xFFFFD700), Color(0xFFFF8C00)],
    },
    {
      'id': 'balance',
      'title': 'Inner Balance',
      'description': 'Find harmony between mind, body, and spirit',
      'icon': Icons.balance,
      'gradient': [Color(0xFF4ECDC4), Color(0xFF44A08D)],
    },
    {
      'id': 'spirituality',
      'title': 'Spiritual Growth',
      'description': 'Deepen your connection with the universe',
      'icon': Icons.auto_awesome,
      'gradient': [Color(0xFF667EEA), Color(0xFF764BA2)],
    },
  ];

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
  }

  @override
  void dispose() {
    _starsController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _toggleIntent(String intentId) {
    setState(() {
      if (_selectedIntents.contains(intentId)) {
        _selectedIntents.remove(intentId);
      } else {
        _selectedIntents.add(intentId);
      }
    });
    HapticsService.selectionClick();
  }

  Future<void> _submitIntents() async {
    if (_selectedIntents.isEmpty) {
      _showErrorSnackBar('Please select at least one area of focus');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      HapticsService.mediumImpact();

      // Save preferences to onboarding provider INCLUDING selected intents
      final preferences = UserPreferences(
        tone: 'balanced', // Default tone, can be customized later
        dailyNotifications: true,
        timezone: 'Europe/Bucharest',
        selectedIntents: _selectedIntents, // Save the selected intents!
      );

      ref.read(onboardingProvider.notifier).setPreferences(preferences);

      HapticsService.heavyImpact();

      if (mounted) {
        context.go('/onboarding/tarot');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorSnackBar('Failed to save your preferences. Please try again.');
      HapticsService.heavyImpact();
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
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
                        context.go('/onboarding/birth-data');
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '2 of 5',
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

                // Title
                Text(
                  'What are you\nseeking guidance on?',
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
                  'Choose the areas where you\'d like cosmic insights to guide your journey',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: const Color(0xFFF5F5F5),
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),

                // Intent cards
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.85,
                        ),
                    itemCount: _intents.length,
                    itemBuilder: (context, index) {
                      final intent = _intents[index];
                      final isSelected = _selectedIntents.contains(
                        intent['id'],
                      );

                      return _buildIntentCard(
                        intent: intent,
                        isSelected: isSelected,
                        onTap: () => _toggleIntent(intent['id']),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Continue button
                Container(
                  width: double.infinity,
                  height: 56,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    onPressed:
                        _isLoading || _selectedIntents.isEmpty
                            ? null
                            : _submitIntents,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedIntents.isNotEmpty
                              ? Colors.white.withOpacity(0.15)
                              : Colors.white.withOpacity(0.05),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child:
                        _isLoading
                            ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                            : Text(
                              'Continue (${_selectedIntents.length})',
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

  Widget _buildIntentCard({
    required Map<String, dynamic> intent,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient:
              isSelected
                  ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: intent['gradient'],
                  )
                  : null,
          color: !isSelected ? Colors.white.withOpacity(0.1) : null,
          border: Border.all(
            color:
                isSelected
                    ? Colors.white.withOpacity(0.3)
                    : Colors.white.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ]
                  : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(isSelected ? 0.2 : 0.1),
              ),
              child: Icon(intent['icon'], color: Colors.white, size: 30),
            ),

            const SizedBox(height: 16),

            Text(
              intent['title'],
              style: const TextStyle(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              intent['description'],
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.normal,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
