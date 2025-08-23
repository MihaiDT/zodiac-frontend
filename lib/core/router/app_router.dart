import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../features/onboarding/get_started_screen.dart';
import '../../features/onboarding/birth_data_screen.dart';
import '../../features/onboarding/intent_screen.dart';
import '../../features/onboarding/first_tarot_draw_screen.dart';
import '../../features/onboarding/daily_promise_screen.dart';
import '../../features/onboarding/streak_intro_screen.dart';
import '../../features/onboarding/providers/onboarding_provider.dart';

// Login/Register screens (placeholders for now)
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Center(child: Text('Login Screen - To be implemented')),
    );
  }
}

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: const Center(child: Text('Register Screen - To be implemented')),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home Screen - Main app')),
    );
  }
}

// Router configuration
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) async {
      // Check if onboarding is completed
      final onboardingCompleted = await ref.read(
        onboardingCompletedProvider.future,
      );

      // If trying to access onboarding when it's already completed, redirect to home
      if (onboardingCompleted &&
          state.fullPath?.startsWith('/onboarding') == true) {
        return '/home';
      }

      // If trying to access home when onboarding is not completed, redirect to start
      if (!onboardingCompleted && state.fullPath == '/home') {
        return '/';
      }

      return null; // No redirect needed
    },
    routes: [
      // Welcome/Get Started route
      GoRoute(path: '/', builder: (context, state) => const GetStartedScreen()),

      // Auth routes
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),

      // Onboarding flow
      GoRoute(
        path: '/onboarding',
        redirect: (context, state) {
          // Always redirect /onboarding to the first step
          return '/onboarding/birth-data';
        },
        routes: [
          GoRoute(
            path: '/birth-data',
            builder: (context, state) => const BirthDataScreen(),
          ),
          GoRoute(
            path: '/preferences',
            builder: (context, state) => const IntentScreen(),
          ),
          GoRoute(
            path: '/tarot',
            builder: (context, state) => const FirstTarotDrawScreen(),
          ),
          GoRoute(
            path: '/notifications',
            builder: (context, state) => const DailyPromiseScreen(),
          ),
          GoRoute(
            path: '/streak',
            builder: (context, state) => const StreakIntroScreen(),
          ),
          GoRoute(
            path: '/register',
            builder: (context, state) => const RegisterScreen(),
          ),
        ],
      ),

      // Main app
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    ],
    errorBuilder:
        (context, state) => Scaffold(
          body: Center(child: Text('Page not found: ${state.error}')),
        ),
  );
});
