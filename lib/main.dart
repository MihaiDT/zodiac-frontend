import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app/router.dart';
import 'app/theme/app_theme.dart';
import 'features/auth/providers/auth_controller.dart';

/// Environment configuration
class Environment {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue:
        'https://zodiac-api-gmapemgtc7dkasg5.centralus-01.azurewebsites.net',
  );

  static const String buildFlavor = String.fromEnvironment(
    'BUILD_FLAVOR',
    defaultValue: 'development',
  );

  static bool get isDevelopment => buildFlavor == 'development';
  static bool get isProduction => buildFlavor == 'production';
}

/// Global provider for the router
final routerProvider = Provider<GoRouter>((ref) {
  return AppRouter.createRouter();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Print environment info in development
  if (Environment.isDevelopment) {
    debugPrint('🌟 Zodiac & Numerology App');
    debugPrint('📍 API Base URL: ${Environment.apiBaseUrl}');
    debugPrint('🏗️ Build Flavor: ${Environment.buildFlavor}');
  }

  runApp(ProviderScope(child: ZodiacNumerologyApp()));
}

class ZodiacNumerologyApp extends ConsumerWidget {
  const ZodiacNumerologyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    // Initialize auth on app startup
    ref.listen(authControllerProvider, (previous, next) {
      // Handle auth state changes if needed
    });

    return MaterialApp.router(
      title: 'Zodiac & Numerology',
      debugShowCheckedModeBanner: false, // Hide debug banner
      // Theme configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark, // Default to dark mode
      // Router configuration
      routerConfig: router,

      // Localization
      supportedLocales: const [Locale('en', 'US'), Locale('ro', 'RO')],
    );
  }
}
