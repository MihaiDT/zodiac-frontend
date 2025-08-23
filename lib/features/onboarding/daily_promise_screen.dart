import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../config/app_colors.dart';
import '../../core/services/haptics_service.dart';

class DailyPromiseScreen extends ConsumerStatefulWidget {
  const DailyPromiseScreen({super.key});

  @override
  ConsumerState<DailyPromiseScreen> createState() => _DailyPromiseScreenState();
}

class _DailyPromiseScreenState extends ConsumerState<DailyPromiseScreen>
    with TickerProviderStateMixin {
  late AnimationController _starsController;
  late AnimationController _pulseController;

  bool _isLoading = true;
  bool _notificationsEnabled = true;
  String _horoscopeContent = '';

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _loadDailyHoroscope();
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

  Future<void> _loadDailyHoroscope() async {
    try {
      // Mock data for onboarding - no API call needed
      await Future.delayed(const Duration(milliseconds: 1000));
      setState(() {
        _horoscopeContent =
            "Today brings new opportunities for growth and self-discovery. Your cosmic energy is aligned with positive changes.";
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _horoscopeContent =
            "Welcome to your daily cosmic journey. Great things await you today!";
        _isLoading = false;
      });
    }
  }

  void _toggleNotifications(bool enabled) {
    setState(() {
      _notificationsEnabled = enabled;
    });
    HapticsService.selectionClick();
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

  void _navigateToNext() {
    HapticsService.lightImpact();
    context.go('/onboarding/streak-intro');
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
                        context.go('/onboarding/tarot');
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '4 of 5',
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

                // Main content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Title
                        Text(
                          'Your Daily\nCosmic Promise',
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
                          'Start each day with personalized cosmic insights',
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

                        // Horoscope content
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.1),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                color: AppColors.primary,
                                size: 40,
                              ),

                              const SizedBox(height: 16),

                              if (_isLoading)
                                const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                )
                              else
                                Text(
                                  _horoscopeContent,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 16,
                                    height: 1.6,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Notification toggle
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withOpacity(0.1),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Daily Notifications',
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Get your cosmic insights every morning',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Switch(
                                value: _notificationsEnabled,
                                onChanged: _toggleNotifications,
                                activeColor: AppColors.primary,
                                inactiveThumbColor: Colors.white.withOpacity(
                                  0.5,
                                ),
                                inactiveTrackColor: Colors.white.withOpacity(
                                  0.2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),

                // Continue button
                Container(
                  width: double.infinity,
                  height: 56,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    onPressed: _navigateToNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.15),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Continue',
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
}
