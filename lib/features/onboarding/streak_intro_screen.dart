import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../config/app_colors.dart';
import '../../core/services/haptics_service.dart';

class StreakIntroScreen extends ConsumerStatefulWidget {
  const StreakIntroScreen({super.key});

  @override
  ConsumerState<StreakIntroScreen> createState() => _StreakIntroScreenState();
}

class _StreakIntroScreenState extends ConsumerState<StreakIntroScreen>
    with TickerProviderStateMixin {
  late AnimationController _starsController;
  late AnimationController _pulseController;
  late AnimationController _constellationController;

  bool _isCompleting = false;

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

    _constellationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _starsController.dispose();
    _pulseController.dispose();
    _constellationController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    setState(() {
      _isCompleting = true;
    });

    try {
      HapticsService.mediumImpact();

      // Complete onboarding - redirect to register screen with onboarding data preserved
      HapticsService.heavyImpact();

      if (mounted) {
        context.go('/register');
      }
    } catch (e) {
      setState(() {
        _isCompleting = false;
      });

      HapticsService.heavyImpact();
    }
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
                        context.go('/onboarding/daily-promise');
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '5 of 5',
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

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Constellation animation
                      AnimatedBuilder(
                        animation: _constellationController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _constellationController.value * 2 * 3.14159,
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    AppColors.primary.withOpacity(0.3),
                                    AppColors.accent.withOpacity(0.1),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                              child: Stack(
                                children: [
                                  // Stars constellation
                                  ..._buildConstellationStars(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 48),

                      // Title
                      Text(
                        'Build Your\nCosmic Streak',
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

                      const SizedBox(height: 24),

                      Text(
                        'Complete daily rituals to unlock deeper cosmic wisdom and build your spiritual momentum',
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

                      // Streak features
                      _buildStreakFeature(
                        icon: Icons.local_fire_department,
                        title: 'Daily Streak Rewards',
                        description:
                            'Unlock exclusive insights as you maintain your cosmic practice',
                      ),

                      const SizedBox(height: 20),

                      _buildStreakFeature(
                        icon: Icons.stars,
                        title: 'Constellation Progress',
                        description:
                            'Watch your spiritual constellation grow with each day',
                      ),

                      const SizedBox(height: 20),

                      _buildStreakFeature(
                        icon: Icons.emoji_events,
                        title: 'Cosmic Achievements',
                        description:
                            'Earn special badges for your dedication to growth',
                      ),

                      const SizedBox(height: 48),
                    ],
                  ),
                ),

                // Complete button
                Container(
                  width: double.infinity,
                  height: 56,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    onPressed: _isCompleting ? null : _completeOnboarding,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.15),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child:
                        _isCompleting
                            ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                            : const Text(
                              'Begin My Journey',
                              style: TextStyle(
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

  Widget _buildStreakFeature({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.1),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.ctaPrimary,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildConstellationStars() {
    final stars = <Widget>[];

    // Create constellation pattern
    final positions = [
      const Offset(100, 50),
      const Offset(150, 80),
      const Offset(120, 120),
      const Offset(80, 120),
      const Offset(50, 80),
      const Offset(100, 100),
    ];

    for (int i = 0; i < positions.length; i++) {
      stars.add(
        Positioned(
          left: positions[i].dx,
          top: positions[i].dy,
          child: AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Container(
                width: 8 + (_pulseController.value * 4),
                height: 8 + (_pulseController.value * 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(
                    0.8 + (_pulseController.value * 0.2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 4 + (_pulseController.value * 4),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    }

    return stars;
  }
}
