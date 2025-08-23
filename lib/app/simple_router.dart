import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/onboarding/simple_get_started_screen.dart';

/// Simple test router to debug navigation issues
class SimpleRouter {
  static GoRouter createRouter() {
    debugPrint('🚀 Creating SimpleRouter...');
    return GoRouter(
      initialLocation: '/get-started',
      debugLogDiagnostics: true,

      // REMOVE redirect completely for testing
      // redirect: (context, state) {
      //   debugPrint('🔀 REDIRECT CALLED!');
      //   debugPrint('🔀 Router redirect - incoming location: ${state.uri}');
      //   debugPrint('🔀 Router redirect - matchedLocation: ${state.matchedLocation}');
      //   debugPrint('🔀 Router redirect - fullPath: ${state.fullPath}');
      //   debugPrint('🔀 Router redirect - returning: null (no redirect)');
      //   return null; // No redirect
      // },

      // Add error handling
      onException: (context, state, router) {
        debugPrint('🚨 Router exception: ${state.error}');
        debugPrint('🚨 Router exception - location: ${state.uri}');
      },

      routes: [
        GoRoute(
          path: '/get-started',
          name: 'get-started',
          builder: (context, state) {
            debugPrint(
              '🏠 Building SimpleGetStartedScreen for path: ${state.uri}',
            );
            return const SimpleGetStartedScreen();
          },
        ),
        GoRoute(
          path: '/onboarding/birth-data',
          name: 'onboarding-birth-data',
          builder: (context, state) {
            debugPrint(
              '🎂 Building simple birth data screen for path: ${state.uri}',
            );
            return Scaffold(
              appBar: AppBar(
                title: const Text('Birth Data - Test'),
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'SUCCESS! 🎉',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Navigation to Birth Data Screen worked!',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        debugPrint('🔙 Going back to get-started');
                        context.go('/get-started');
                      },
                      child: const Text('Back to Get Started'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Simple provider for the test router
final simpleRouterProvider = Provider<GoRouter>((ref) {
  return SimpleRouter.createRouter();
});
