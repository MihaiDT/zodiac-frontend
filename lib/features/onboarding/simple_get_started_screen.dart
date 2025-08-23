import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimpleGetStartedScreen extends StatelessWidget {
  const SimpleGetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Zodiac App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                print('🚀 Simple Get Started button pressed!');
                print('🔄 Attempting navigation to /onboarding/birth-data');

                // Get router instance directly
                final router = GoRouter.of(context);
                print('📍 Router instance found: $router');
                print(
                  '📍 Current router location: ${router.routeInformationProvider.value.uri}',
                );

                // Try multiple navigation methods
                try {
                  print('📱 Trying context.push...');
                  context.push('/onboarding/birth-data');
                  print('✅ Push navigation executed');
                } catch (e) {
                  print('❌ Push failed: $e');

                  try {
                    print('📱 Trying context.go...');
                    context.go('/onboarding/birth-data');
                    print('✅ Go navigation executed');
                  } catch (e2) {
                    print('❌ Go failed: $e2');

                    try {
                      print('📱 Trying context.pushNamed...');
                      context.pushNamed('onboarding-birth-data');
                      print('✅ PushNamed navigation executed');
                    } catch (e3) {
                      print('❌ PushNamed failed: $e3');

                      // Try direct router navigation
                      try {
                        print('📱 Trying router.go directly...');
                        router.go('/onboarding/birth-data');
                        print('✅ Direct router.go executed');
                      } catch (e4) {
                        print('❌ Direct router.go failed: $e4');
                      }
                    }
                  }
                }

                // Check result after delay
                Future.delayed(const Duration(milliseconds: 300), () {
                  final currentLocation =
                      GoRouter.of(
                        context,
                      ).routeInformationProvider.value.uri.toString();
                  print(
                    '📍 Current location after navigation: $currentLocation',
                  );
                });

                // Check again after longer delay
                Future.delayed(const Duration(milliseconds: 1000), () {
                  final currentLocation =
                      GoRouter.of(
                        context,
                      ).routeInformationProvider.value.uri.toString();
                  print('📍 Current location after 1s: $currentLocation');
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Get Started - Simple Test'),
            ),
          ],
        ),
      ),
    );
  }
}
