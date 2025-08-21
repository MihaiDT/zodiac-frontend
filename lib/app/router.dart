import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/login_screen.dart';
import '../features/auth/register_screen.dart';
import '../features/auth/profile_screen.dart';
import '../presentation/shell/app_shell.dart';
import '../features/common/screens/dashboard_screen.dart';
import '../features/zodiac/zodiac_screen.dart';
import '../features/numerology/numerology_screen.dart';

/// App Router configuration using GoRouter
class AppRouter {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: '/dashboard',
      debugLogDiagnostics: true,

      routes: [
        // Authentication routes (no shell)
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => const RegisterScreen(),
        ),

        // Main app routes (with shell)
        ShellRoute(
          builder: (context, state, child) => AppShell(child: child),
          routes: [
            GoRoute(
              path: '/dashboard',
              name: 'dashboard',
              builder: (context, state) => const DashboardScreen(),
            ),
            GoRoute(
              path: '/zodiac',
              name: 'zodiac',
              builder: (context, state) => const ZodiacScreen(),
              routes: [
                GoRoute(
                  path: '/sign/:signId',
                  name: 'zodiac-sign',
                  builder: (context, state) {
                    final signId = state.pathParameters['signId']!;
                    return ZodiacSignDetailScreen(signId: signId);
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/numerology',
              name: 'numerology',
              builder: (context, state) => const NumerologyScreen(),
              routes: [
                GoRoute(
                  path: '/calculate',
                  name: 'numerology-calculate',
                  builder: (context, state) =>
                      const NumerologyCalculateScreen(),
                ),
              ],
            ),
            GoRoute(
              path: '/horoscope',
              name: 'horoscope',
              builder: (context, state) => const HoroscopeScreen(),
            ),
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],

      // Error handling
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Page not found: ${state.uri.toString()}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go('/dashboard'),
                child: const Text('Go to Dashboard'),
              ),
            ],
          ),
        ),
      ),

      // Redirect logic (authentication guard)
      redirect: (context, state) {
        // TODO: Implement authentication check
        // final isAuthenticated = ref.read(authProvider).isAuthenticated;
        // final isLoginRoute = state.location.startsWith('/login') ||
        //                     state.location.startsWith('/register');

        // if (!isAuthenticated && !isLoginRoute) {
        //   return '/login';
        // }

        // if (isAuthenticated && isLoginRoute) {
        //   return '/dashboard';
        // }

        return null; // No redirect needed
      },
    );
  }
}

// Placeholder screens that will be implemented later
class ZodiacSignDetailScreen extends StatelessWidget {
  final String signId;

  const ZodiacSignDetailScreen({super.key, required this.signId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zodiac Sign: $signId')),
      body: Center(child: Text('Details for zodiac sign: $signId')),
    );
  }
}

class NumerologyCalculateScreen extends StatelessWidget {
  const NumerologyCalculateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Numerology Calculator')),
      body: const Center(child: Text('Numerology calculation screen')),
    );
  }
}

class HoroscopeScreen extends StatelessWidget {
  const HoroscopeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Daily Horoscope'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            'Daily horoscope screen',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
