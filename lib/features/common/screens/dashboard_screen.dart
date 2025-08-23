import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

/// SEXY PREMIUM ASTROLOGY DASHBOARD - ABSOLUTELY STUNNING! 🔥✨💫
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SEXY HEADER cu gradient INCREDIBLE!
              Container(
                height: 320,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFFF416C), // Hot pink
                      const Color(0xFFFF4B2B), // Sunset orange
                      const Color(0xFFFFD93D), // Golden yellow
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Stack(
                  children: [
                    // Floating stars animation
                    ...List.generate(20, (index) => Positioned(
                      left: (index * 73.5) % MediaQuery.of(context).size.width,
                      top: (index * 37.3) % 280,
                      child: Container(
                        width: 3 + (index % 5),
                        height: 3 + (index % 5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.8),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    )),
                    
                    // Main content
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top bar
                          Row(
                            children: [
                              const Text(
                                '9:41',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(22.5),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  CupertinoIcons.person_circle_fill,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 40),
                          
                          // Welcome text SPECTACULAR
                          const Text(
                            'Welcome back,',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'COSMIC QUEEN ✨',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                          
                          const SizedBox(height: 15),
                          
                          Text(
                            'The universe has amazing things planned for you today!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                          
                          // Action button SEXY
                          GestureDetector(
                            onTap: () => context.go('/chat'),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 15,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Discover Your Destiny',
                                    style: TextStyle(
                                      color: Color(0xFFFF416C),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    CupertinoIcons.sparkles,
                                    color: Color(0xFFFF416C),
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              // SERVICES SECTION PREMIUM
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color(0xFFFF416C),
                          Color(0xFFFFD93D),
                        ],
                      ).createShader(bounds),
                      child: const Text(
                        'MYSTICAL SERVICES',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // First row of services
                    Row(
                      children: [
                        Expanded(
                          child: _buildPremiumCard(
                            context,
                            'TAROT\nREADING',
                            '🔮',
                            const LinearGradient(
                              colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)],
                            ),
                            '/chat',
                            180,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _buildPremiumCard(
                            context,
                            'BIRTH\nCHART',
                            '⭐',
                            const LinearGradient(
                              colors: [Color(0xFFFFD93D), Color(0xFFFF8008)],
                            ),
                            '/zodiac',
                            140,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Second row
                    Row(
                      children: [
                        Expanded(
                          child: _buildPremiumCard(
                            context,
                            'CRYSTAL\nHEALING',
                            '💎',
                            const LinearGradient(
                              colors: [Color(0xFF8EC5FC), Color(0xFFE0C3FC)],
                            ),
                            '/numerology',
                            140,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _buildPremiumCard(
                            context,
                            'MOON\nPHASES',
                            '🌙',
                            const LinearGradient(
                              colors: [Color(0xFFA8E6CF), Color(0xFF88D8C0)],
                            ),
                            '/profile',
                            180,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 35),
              
              // TODAY'S COSMIC VIBE
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF2D1B69),
                      Color(0xFF11998e),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2D1B69).withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          '🌟',
                          style: TextStyle(fontSize: 28),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'TODAY\'S COSMIC VIBE',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 15),
                    
                    const Text(
                      'Your energy is absolutely magnetic today! The stars are conspiring to bring you incredible opportunities. Trust your intuition and embrace the magic! ✨',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Stats row
                    Row(
                      children: [
                        _buildStatItem('LOVE', '95%', '💕'),
                        const SizedBox(width: 25),
                        _buildStatItem('CAREER', '88%', '💼'),
                        const SizedBox(width: 25),
                        _buildStatItem('LUCK', '92%', '🍀'),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 100), // Bottom spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPremiumCard(
    BuildContext context,
    String title,
    String emoji,
    LinearGradient gradient,
    String route,
    double height,
  ) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: gradient.colors.first.withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background pattern
            Positioned(
              right: -20,
              bottom: -20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    emoji,
                    style: const TextStyle(fontSize: 35),
                  ),
                  
                  const Spacer(),
                  
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      height: 1.1,
                      letterSpacing: 1,
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      CupertinoIcons.arrow_up_right,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, String emoji) {
    return Column(
      children: [
        Text(
          emoji,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
