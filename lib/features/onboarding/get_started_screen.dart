import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A2E), // Dark navy
              Color(0xFF16213E), // Slightly lighter navy
              Color(0xFF0F3460), // Deep blue
            ],
          ),
        ),
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
                                            Colors.amber,
                                            Colors.orange,
                                            Colors.deepOrange,
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.amber.withOpacity(
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

                              // Planets orbiting
                              ...List.generate(3, (planetIndex) {
                                final radius = 60.0 + (planetIndex * 30.0);
                                final speed = [1.0, 0.7, 0.4][planetIndex];
                                final angle =
                                    _solarSystemController.value *
                                    2 *
                                    math.pi *
                                    speed;

                                final x = centerX + radius * math.cos(angle);
                                final y = centerY + radius * math.sin(angle);

                                final planetColors = [
                                  Colors.lightBlue,
                                  Colors.redAccent,
                                  Colors.orange,
                                ];

                                final planetSizes = [10.0, 8.0, 14.0];

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
                                            color: Colors.white.withOpacity(
                                              0.1,
                                            ),
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
                                                  .withOpacity(0.5),
                                              blurRadius: 8,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),

                              // Zodiac symbols around the outer edge
                              ...List.generate(12, (index) {
                                final angle = (index * 30.0) * (math.pi / 180);
                                final radius = math.min(
                                  containerWidth * 0.35,
                                  120.0,
                                ); // Responsive radius
                                final symbolSize = 30.0;

                                final x =
                                    centerX +
                                    radius * math.cos(angle - math.pi / 2);
                                final y =
                                    centerY +
                                    radius * math.sin(angle - math.pi / 2);

                                final symbols = [
                                  '♈',
                                  '♉',
                                  '♊',
                                  '♋',
                                  '♌',
                                  '♍',
                                  '♎',
                                  '♏',
                                  '♐',
                                  '♑',
                                  '♒',
                                  '♓',
                                ];

                                return Positioned(
                                  left: x - symbolSize / 2,
                                  top: y - symbolSize / 2,
                                  child: Container(
                                    width: symbolSize,
                                    height: symbolSize,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.purple.withOpacity(0.3),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.4),
                                        width: 1.5,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.purple.withOpacity(0.2),
                                          blurRadius: 8,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        symbols[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                        color: Colors.white.withOpacity(0.8),
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
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1A1A2E),
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
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                      children: const [
                        TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Colors.white,
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
