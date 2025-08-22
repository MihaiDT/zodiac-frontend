import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/auth/login_screen.dart';
import '../features/auth/register_screen.dart';
import '../features/auth/providers/auth_controller.dart';
import '../features/profile/profile_management_screen.dart';
import '../presentation/shell/app_shell.dart';
import '../features/common/screens/dashboard_screen.dart';
import '../features/zodiac/zodiac_screen.dart';
import '../features/zodiac/zodiac_sign_detail_screen.dart';
import '../features/numerology/numerology_screen.dart';
import '../features/horoscope/horoscope_screen.dart';

/// App Router configuration using GoRouter
class AppRouter {
  static GoRouter createRouter(Ref ref) {
    return GoRouter(
      initialLocation: '/login', // Start with login instead of dashboard
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
                  builder:
                      (context, state) => const NumerologyCalculateScreen(),
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
              builder: (context, state) => const ProfileManagementScreen(),
            ),
          ],
        ),
      ],

      // Error handling
      errorBuilder:
          (context, state) => Scaffold(
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
                    onPressed: () => context.go('/login'),
                    child: const Text('Go to Login'),
                  ),
                ],
              ),
            ),
          ),

      // Redirect logic (authentication guard)
      redirect: (context, state) {
        final isAuthenticated = ref.read(isAuthenticatedProvider);
        final isLoading = ref.read(authLoadingProvider);
        final isLoginRoute = state.fullPath?.startsWith('/login') == true ||
                            state.fullPath?.startsWith('/register') == true;

        // Don't redirect while authentication is loading
        if (isLoading) {
          return null;
        }

        // If not authenticated and trying to access protected routes, redirect to login
        if (!isAuthenticated && !isLoginRoute) {
          return '/login';
        }

        // If authenticated and on login routes, redirect to dashboard
        if (isAuthenticated && isLoginRoute) {
          return '/dashboard';
        }

        return null; // No redirect needed
      },
    );
  }
}

// Placeholder screens that will be implemented later
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
