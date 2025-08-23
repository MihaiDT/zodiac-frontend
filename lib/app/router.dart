import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/auth/login_screen.dart';
import '../features/auth/register_screen.dart';
import '../features/auth/providers/auth_controller.dart';
import '../features/onboarding/get_started_screen.dart';
import '../features/profile/profile_management_screen.dart';
import '../presentation/shell/app_shell.dart';
import '../features/common/screens/dashboard_screen.dart';
import '../features/zodiac/zodiac_screen.dart';
import '../features/zodiac/zodiac_sign_detail_screen.dart';
import '../features/numerology/numerology_screen.dart';
import '../features/horoscope/horoscope_screen.dart';
import '../features/chat/chat_screen.dart';
import '../config/environment.dart';

/// App Router configuration using GoRouter
class AppRouter {
  static GoRouter createRouter(Ref ref) {
    return GoRouter(
      initialLocation: '/get-started', // Start with get started screen
      debugLogDiagnostics: true,

      routes: [
        // Onboarding route
        GoRoute(
          path: '/get-started',
          name: 'get-started',
          builder: (context, state) => const GetStartedScreen(),
        ),

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
              path: '/chat',
              name: 'chat',
              builder: (context, state) => const ChatScreen(),
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
                    onPressed: () => context.go('/get-started'),
                    child: const Text('Go to Home'),
                  ),
                ],
              ),
            ),
          ),

      // Redirect logic (authentication guard)
      redirect: (context, state) {
        final isAuthenticated = ref.read(isAuthenticatedProvider);
        final isLoading = ref.read(authLoadingProvider);
        final isGetStartedRoute =
            state.fullPath?.startsWith('/get-started') == true;
        final isLoginRoute =
            state.fullPath?.startsWith('/login') == true ||
            state.fullPath?.startsWith('/register') == true;

        // Don't redirect while authentication is loading
        if (isLoading) {
          return null;
        }

        // In development mode, allow access to protected routes without authentication
        if (Environment.buildFlavor == 'development') {
          // If authenticated and on auth/onboarding routes, redirect to dashboard
          if (isAuthenticated && (isLoginRoute || isGetStartedRoute)) {
            return '/dashboard';
          }
          // Allow access to all routes in development
          return null;
        }

        // Production authentication logic
        // If not authenticated and trying to access protected routes, redirect to get started
        if (!isAuthenticated && !isLoginRoute && !isGetStartedRoute) {
          return '/get-started';
        }

        // If authenticated and on auth/onboarding routes, redirect to dashboard
        if (isAuthenticated && (isLoginRoute || isGetStartedRoute)) {
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
