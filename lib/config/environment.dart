/// Environment configuration for the Zodiac AI App
/// Uses --dart-define values for configuration
class Environment {
  /// API Base URL - configured via --dart-define=API_BASE_URL
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue:
        'https://zodiac-api-gmapemgtc7dkasg5.centralus-01.azurewebsites.net',
  );

  /// Sentry DSN for error tracking - configured via --dart-define=SENTRY_DSN
  static const String sentryDsn = String.fromEnvironment(
    'SENTRY_DSN',
    defaultValue: '',
  );

  /// Build flavor - configured via --dart-define=BUILD_FLAVOR
  static const String buildFlavor = String.fromEnvironment(
    'BUILD_FLAVOR',
    defaultValue: 'development',
  );

  /// Debug mode flag
  static const bool isDebug =
      String.fromEnvironment('BUILD_FLAVOR') != 'production';

  /// Print current environment configuration
  static void printConfig() {
    print('🌟 Zodiac AI App Environment Configuration:');
    print('   API Base URL: $apiBaseUrl');
    print('   Build Flavor: $buildFlavor');
    print('   Debug Mode: $isDebug');
    if (sentryDsn.isNotEmpty) {
      print('   Sentry DSN: ${sentryDsn.substring(0, 20)}...');
    }
  }
}
