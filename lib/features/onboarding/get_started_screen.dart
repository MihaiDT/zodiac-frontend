import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import '../../config/app_colors.dart';

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

  // Zodiac data with unique mapping - no duplicates, logical order
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
    ZodiacData(
      symbol: '♓',
      imagePath: 'assets/images/zodii/Frame.png',
    ), // Pisces - Feb 19 - Mar 20 (using Frame.png, positioned opposite to Aries)
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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.mainGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
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
                              // Solar system center - Sun
                              AnimatedBuilder(
                                animation: _pulseController,
                                builder: (context, child) {
                                  final pulse =
                                      1.0 + (_pulseController.value * 0.2);
                                  return Positioned(
                                    left: centerX - (25 * pulse),
                                    top: centerY - (25 * pulse),
                                    child: Container(
                                      width: 50 * pulse,
                                      height: 50 * pulse,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: const RadialGradient(
                                          colors: [
                                            AppColors.sun,
                                            AppColors.sunGlow,
                                            Colors.deepOrange,
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.sun.withOpacity(
                                              0.6,
                                            ),
                                            blurRadius: 15 * pulse,
                                            spreadRadius: 3 * pulse,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.wb_sunny,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  );
                                },
                              ),

                              // Planets orbiting - adjusted to fit screen
                              ...List.generate(2, (planetIndex) {
                                final radius =
                                    80.0 +
                                    (planetIndex *
                                        20.0); // Reduced distance between orbits - closer together
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

                                final x = centerX + radius * math.cos(angle);
                                final y = centerY + radius * math.sin(angle);

                                final planetColors = [
                                  AppColors.planetBlue,
                                  AppColors.planetRed,
                                ]; // Only 2 planets now

                                final planetSizes = [
                                  14.0,
                                  10.0,
                                ]; // Only 2 planets now

                                return Stack(
                                  children: [
                                    // Orbit path
                                    Positioned(
                                      left: centerX - radius,
                                      top: centerY - radius,
                                      child: Container(
                                        width: radius * 2,
                                        height: radius * 2,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.orbitLine,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Planet
                                    Positioned(
                                      left: x - planetSizes[planetIndex] / 2,
                                      top: y - planetSizes[planetIndex] / 2,
                                      child: Container(
                                        width: planetSizes[planetIndex],
                                        height: planetSizes[planetIndex],
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: RadialGradient(
                                            colors: [
                                              planetColors[planetIndex]
                                                  .withOpacity(0.8),
                                              planetColors[planetIndex],
                                            ],
                                            stops: const [0.3, 1.0],
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: planetColors[planetIndex]
                                                  .withOpacity(
                                                    0.6,
                                                  ), // More intense
                                              blurRadius: 12, // Increased glow
                                              spreadRadius:
                                                  3, // Increased spread
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),

                              // Zodiac orbit - outermost orbit line
                              Positioned(
                                left:
                                    centerX -
                                    math.min(containerWidth * 0.4, 170.0),
                                top:
                                    centerY -
                                    math.min(containerWidth * 0.4, 170.0),
                                child: Container(
                                  width:
                                      math.min(containerWidth * 0.4, 170.0) * 2,
                                  height:
                                      math.min(containerWidth * 0.4, 170.0) * 2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.purple.withOpacity(0.3),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),

                              // Zodiac symbols on the outermost orbit, perfectly centered and evenly distributed
                              ...List.generate(12, (index) {
                                final angle =
                                    (index * 30.0) *
                                    (math.pi /
                                        180); // Perfect 360°/12 = 30° distribution
                                final radius = math.min(
                                  containerWidth * 0.4,
                                  170.0,
                                ); // Same as orbit line radius
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
                                  child: Container(
                                    width: symbolSize,
                                    height: symbolSize,
                                    child: ClipOval(
                                      child: Container(
                                        width: symbolSize,
                                        height: symbolSize,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.zodiacCircle
                                              .withOpacity(0.4), // More visible
                                          border: Border.all(
                                            color: AppColors.textPrimary
                                                .withOpacity(
                                                  0.6,
                                                ), // More visible
                                            width: 2, // Thicker border
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.zodiacCircle
                                                  .withOpacity(0.3),
                                              blurRadius: 12, // Increased glow
                                              spreadRadius:
                                                  3, // Increased spread
                                            ),
                                          ],
                                        ),
                                        child: Center(
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
                                                style: const TextStyle(
                                                  color: AppColors.textPrimary,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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

                // Title and subtitle
                Column(
                  children: [
                    Text(
                      'Discover Your',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w300,
                        fontSize: 32,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Cosmic Journey',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Unlock the secrets of your zodiac sign, explore numerology insights, and get personalized horoscopes tailored just for you.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                const Spacer(flex: 1),

                // Get Started button
                Container(
                  width: double.infinity,
                  height: 56,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    onPressed: () => context.go('/login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textPrimary,
                      foregroundColor: AppColors.primaryDark,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // Sign in link
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                      children: const [
                        TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
