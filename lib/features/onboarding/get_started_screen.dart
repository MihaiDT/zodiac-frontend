import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For haptic feedback
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import '../../config/app_colors.dart';
import '../../core/services/haptics_service.dart';

// Premium Haptic Feedback Helper Class
class PremiumHaptics {
  // Light feedback for secondary interactions (cards, icons)
  static void light() {
    HapticFeedback.lightImpact();
  }

  // Medium feedback for primary buttons and important actions
  static void medium() {
    HapticFeedback.mediumImpact();
  }

  // Heavy feedback for confirmations and successful actions
  static void heavy() {
    HapticFeedback.heavyImpact();
  }

  // Success feedback for completed actions
  static void success() {
    HapticFeedback.heavyImpact(); // iOS-like success feeling
  }

  // Selection feedback for picking items
  static void selection() {
    HapticFeedback.selectionClick();
  }
}

// Custom painter for subtle cosmic stars effect
class StarsPainter extends CustomPainter {
  final double animationValue;
  final bool isDarkMode;

  StarsPainter(this.animationValue, this.isDarkMode);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final random = math.Random(42); // Fixed seed for consistent stars

    for (int i = 0; i < 80; i++) {
      // Increased stars count
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final opacity =
          (0.3 + 0.6 * math.sin(animationValue * 2 * math.pi + i)).abs();

      // White stars for both light and dark mode
      paint.color = Colors.white.withOpacity(opacity * 0.7);

      if (isDarkMode) {
        canvas.drawCircle(
          Offset(x, y),
          1.2,
          paint,
        ); // Standard size for dark mode
      } else {
        canvas.drawCircle(
          Offset(x, y),
          1.0,
          paint,
        ); // Slightly smaller for light mode
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Data class for zodiac signs
class ZodiacData {
  final String symbol;
  final String imagePath;

  const ZodiacData({required this.symbol, required this.imagePath});
}

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen>
    with TickerProviderStateMixin {
  late AnimationController _solarSystemController;
  late AnimationController _starsController;
  late AnimationController _pulseController;

  // Zodiac data - 11 unique signs with unique images (no duplicates)
  static const List<ZodiacData> _zodiacData = [
    ZodiacData(
      symbol: '♈',
      imagePath: 'assets/images/zodii/Frame.png',
    ), // Aries - Mar 21 - Apr 19
    ZodiacData(
      symbol: '♉',
      imagePath: 'assets/images/zodii/Frame-1.png',
    ), // Taurus - Apr 20 - May 20
    ZodiacData(
      symbol: '♊',
      imagePath: 'assets/images/zodii/Frame-2.png',
    ), // Gemini - May 21 - Jun 20
    ZodiacData(
      symbol: '♋',
      imagePath: 'assets/images/zodii/Frame-3.png',
    ), // Cancer - Jun 21 - Jul 22
    ZodiacData(
      symbol: '♌',
      imagePath: 'assets/images/zodii/Frame-4.png',
    ), // Leo - Jul 23 - Aug 22
    ZodiacData(
      symbol: '♍',
      imagePath: 'assets/images/zodii/Frame-5.png',
    ), // Virgo - Aug 23 - Sep 22
    ZodiacData(
      symbol: '♎',
      imagePath: 'assets/images/zodii/Frame-6.png',
    ), // Libra - Sep 23 - Oct 22
    ZodiacData(
      symbol: '♏',
      imagePath: 'assets/images/zodii/Frame-7.png',
    ), // Scorpio - Oct 23 - Nov 21
    ZodiacData(
      symbol: '♐',
      imagePath: 'assets/images/zodii/Frame-8.png',
    ), // Sagittarius - Nov 22 - Dec 21
    ZodiacData(
      symbol: '♑',
      imagePath: 'assets/images/zodii/Frame-9.png',
    ), // Capricorn - Dec 22 - Jan 19
    ZodiacData(
      symbol: '♒',
      imagePath: 'assets/images/zodii/Frame-10.png',
    ), // Aquarius - Jan 20 - Feb 18
  ];

  @override
  void initState() {
    super.initState();
    _solarSystemController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _starsController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _solarSystemController.dispose();
    _starsController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:
              isDarkMode
                  ? AppColors
                      .gradient4 // Premium cosmic gradient for dark mode
                  : AppColors
                      .backgroundLight, // Original theme gradient for light mode
        ),
        child: Stack(
          children: [
            // Subtle cosmic stars effect for both modes
            AnimatedBuilder(
              animation: _starsController,
              builder: (context, child) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: CustomPaint(
                    painter: StarsPainter(_starsController.value, isDarkMode),
                  ),
                );
              },
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // Skip to Dashboard button - top right
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.15),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              PremiumHaptics.medium();
                              context.go('/dashboard');
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.dashboard_outlined,
                                  size: 16,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Skip',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(flex: 1),

                    // Solar system animation - responsive and centered
                    Container(
                      height: 400,
                      width: double.infinity,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final containerWidth = constraints.maxWidth;
                          final containerHeight = 400.0;
                          final centerX = containerWidth / 2;
                          final centerY = containerHeight / 2;

                          return AnimatedBuilder(
                            animation: _solarSystemController,
                            builder: (context, child) {
                              return Stack(
                                children: [
                                  // Beautiful sun icon at center
                                  Positioned(
                                    left:
                                        centerX -
                                        30, // Adjusted for larger size
                                    top:
                                        centerY -
                                        30, // Adjusted for larger size
                                    child: Container(
                                      width: 60, // Increased from 40
                                      height: 60, // Increased from 40
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        // No background, no gradient, no shadow - just the icon
                                      ),
                                      child: Icon(
                                        Icons.wb_sunny_outlined,
                                        color:
                                            Colors
                                                .white, // Simple white for best visibility
                                        size: 36, // Increased from 24
                                      ),
                                    ),
                                  ),

                                  // Planets orbiting with equal spacing
                                  ...List.generate(2, (planetIndex) {
                                    // Equal spacing: 60px, 90px, 120px, 150px, 180px
                                    final radius =
                                        60.0 +
                                        (planetIndex *
                                            30.0); // 60, 90, 120 etc.
                                    final speed =
                                        [
                                          1.0,
                                          0.7,
                                        ][planetIndex]; // Only 2 planets now
                                    final initialOffset =
                                        planetIndex *
                                        math.pi /
                                        2; // Different starting positions
                                    final angle =
                                        (_solarSystemController.value *
                                            2 *
                                            math.pi *
                                            speed) +
                                        initialOffset;

                                    final x =
                                        centerX + radius * math.cos(angle);
                                    final y =
                                        centerY + radius * math.sin(angle);

                                    final planetColors =
                                        isDarkMode
                                            ? [
                                              Colors.white.withOpacity(
                                                0.8,
                                              ), // Prima planetă - alb subtil pentru dark mode
                                              AppColors
                                                  .pastelAccent, // A doua planetă - roz pastel pentru dark mode
                                            ]
                                            : [
                                              Colors
                                                  .white, // Prima planetă - alb pur pentru light mode
                                              AppColors.primary.withOpacity(
                                                0.7,
                                              ), // A doua planetă - violet subtil pentru light mode
                                            ]; // More elegant planet colors

                                    final planetSizes = [
                                      14.0,
                                      10.0,
                                    ]; // Only 2 planets now

                                    return Stack(
                                      children: [
                                        // Enhanced orbit path
                                        Positioned(
                                          left: centerX - radius,
                                          top: centerY - radius,
                                          child: Container(
                                            width: radius * 2,
                                            height: radius * 2,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white.withOpacity(
                                                  0.2,
                                                ), // Consistent glass border
                                                width: 1.0, // Thinner
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Planet
                                        Positioned(
                                          left:
                                              x - planetSizes[planetIndex] / 2,
                                          top: y - planetSizes[planetIndex] / 2,
                                          child: GestureDetector(
                                            onTap: () {
                                              // Selection haptic feedback for cosmic elements
                                              PremiumHaptics.selection();
                                              // Future: Add planet information
                                            },
                                            child: Container(
                                              width: planetSizes[planetIndex],
                                              height: planetSizes[planetIndex],
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: RadialGradient(
                                                  colors: [
                                                    Colors.white.withOpacity(
                                                      0.9,
                                                    ), // Bright center for both planets
                                                    planetColors[planetIndex]
                                                        .withOpacity(
                                                          0.6,
                                                        ), // Subtle color edge
                                                  ],
                                                  stops: const [
                                                    0.2,
                                                    1.0,
                                                  ], // More defined center
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        planetColors[planetIndex]
                                                            .withOpacity(
                                                              0.2,
                                                            ), // Very subtle glow
                                                    blurRadius: 6, // Soft glow
                                                    spreadRadius:
                                                        1, // Minimal spread
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ), // Closing Container
                                        ), // Closing GestureDetector
                                      ],
                                    );
                                  }),

                                  // Zodiac cosmic aura (simplified and subtle)
                                  Positioned(
                                    left:
                                        centerX -
                                        155, // 150px radius + 5px glow
                                    top: centerY - 155,
                                    child: Container(
                                      width: 310, // (150 + 5) * 2
                                      height: 310,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          // Subtle mystical glow
                                          BoxShadow(
                                            color: AppColors.primary
                                                .withOpacity(0.15),
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // Zodiac circle border (150px radius for equal spacing)
                                  Positioned(
                                    left: centerX - 150, // Fixed 150px radius
                                    top: centerY - 150,
                                    child: Container(
                                      width: 300, // 150 * 2
                                      height: 300,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white.withOpacity(
                                            0.2,
                                          ), // Consistent glass border
                                          width: 1.0, // Thinner
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Zodiac symbols - 11 unique signs evenly distributed
                                  ...List.generate(11, (index) {
                                    final angle =
                                        (index * (360.0 / 11)) *
                                        (math.pi /
                                            180); // Perfect 360°/11 = ~32.7° distribution
                                    final radius =
                                        150.0; // Fixed radius for equal spacing with orbit
                                    final symbolSize =
                                        40.0; // Slightly smaller to fit better on the orbit line

                                    final x =
                                        centerX +
                                        radius * math.cos(angle - math.pi / 2);
                                    final y =
                                        centerY +
                                        radius * math.sin(angle - math.pi / 2);

                                    final zodiacData = _zodiacData[index];

                                    return Positioned(
                                      left: x - symbolSize / 2,
                                      top: y - symbolSize / 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Light haptic feedback for zodiac interactions
                                          HapticsService.lightImpact();
                                          // Future: Add zodiac detail navigation
                                        },
                                        child: Container(
                                          width: symbolSize,
                                          height: symbolSize,
                                          child: ClipOval(
                                            child: Container(
                                              width: symbolSize,
                                              height: symbolSize,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white.withOpacity(
                                                  0.15,
                                                ), // Same glass effect for both modes
                                                border: Border.all(
                                                  color: Colors.white.withOpacity(
                                                    0.2,
                                                  ), // Same glass border for both modes
                                                  width: 1.0, // Thinner border
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(
                                                      0.1,
                                                    ), // Same subtle shadow as button
                                                    blurRadius:
                                                        20, // Same as button
                                                    spreadRadius:
                                                        0, // Same as button
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: ColorFiltered(
                                                  colorFilter: ColorFilter.mode(
                                                    isDarkMode
                                                        ? AppColors.primary
                                                            .withOpacity(
                                                              0.15,
                                                            ) // Violet tint for dark mode
                                                        : AppColors.accent
                                                            .withOpacity(
                                                              0.1,
                                                            ), // Blue tint for light mode
                                                    BlendMode
                                                        .colorBurn, // Subtle blend that preserves details
                                                  ),
                                                  child: Image.asset(
                                                    zodiacData.imagePath,
                                                    width:
                                                        symbolSize *
                                                        0.7, // 70% of container size
                                                    height: symbolSize * 0.7,
                                                    fit: BoxFit.contain,
                                                    errorBuilder: (
                                                      context,
                                                      error,
                                                      stackTrace,
                                                    ) {
                                                      // Fallback to text if image fails to load
                                                      return Text(
                                                        zodiacData.symbol,
                                                        style: TextStyle(
                                                          color:
                                                              isDarkMode
                                                                  ? AppColors
                                                                      .textPrimaryDark
                                                                  : AppColors
                                                                      .textPrimary,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ), // Closing ColorFiltered
                                              ),
                                            ),
                                          ),
                                        ),
                                      ), // Closing GestureDetector
                                    );
                                  }),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),

                    const Spacer(flex: 1),

                    // Title and subtitle - Gradient text for light mode
                    Column(
                      children: [
                        Text(
                          'Discover Your',
                          style: TextStyle(
                            fontFamily: 'Playfair Display',
                            color: Colors.white, // Always white
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Cosmic Journey',
                          style: TextStyle(
                            fontFamily: 'Playfair Display',
                            color: Colors.white, // Always white
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            height: 1.1,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        // Premium descriptive text - adaptive colors
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: const Color(
                                0xFFF5F5F5,
                              ), // Off-white for good contrast on gradient background
                              fontSize: 16,
                              height: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                            children: const [
                              TextSpan(
                                text:
                                    'Unlock the secrets of your zodiac sign, explore numerology insights, and get personalized horoscopes tailored just for you.',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const Spacer(flex: 1),

                    // Premium CTA button with enhanced visibility
                    Container(
                      width: double.infinity,
                      height: 56,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white.withOpacity(
                          0.15,
                        ), // Semi-transparent white
                        border: Border.all(
                          color: Colors.white.withOpacity(
                            0.2,
                          ), // Subtle white border
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(
                              0.1,
                            ), // Subtle dark shadow
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: const Offset(0, 8),
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1), // Inner glow
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Premium haptic feedback for primary CTA
                          print('Get Started button pressed!'); // Debug
                          HapticsService.mediumImpact();
                          print(
                            'Navigating to /onboarding/birth-data',
                          ); // Debug

                          // Simple navigation without auth interference
                          context.go('/onboarding/birth-data');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w600, // SemiBold
                            letterSpacing: 0.5,
                            color:
                                isDarkMode
                                    ? Colors.white
                                    : AppColors
                                        .darkBackground, // White on dark, dark on light
                          ),
                        ),
                      ),
                    ),

                    // Premium Sign in link with accent color
                    TextButton(
                      onPressed: () {
                        // Light haptic feedback for secondary actions
                        HapticsService.lightImpact();
                        context.go('/login');
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color:
                                isDarkMode
                                    ? Colors.white.withOpacity(
                                      0.9,
                                    ) // More opaque for dark mode
                                    : const Color(
                                      0xFF2E2E2E,
                                    ), // Darker for light mode for better contrast
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            const TextSpan(text: 'Already have an account? '),
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color:
                                    isDarkMode
                                        ? Colors.white
                                        : AppColors
                                            .darkBackground, // Same as Get Started button
                                fontWeight:
                                    FontWeight
                                        .w600, // Make it bold for better visibility
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
