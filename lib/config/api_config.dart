import 'environment.dart';

/// API configuration for Zodiac AI App
/// Handles all API endpoints and configuration
class ApiConfig {
  /// Base URL for the API (from environment)
  static String get baseUrl => Environment.apiBaseUrl;

  /// API endpoints
  static const String _apiPrefix = '/api';

  // Authentication endpoints
  static String get registerUrl => '$baseUrl$_apiPrefix/auth/register';
  static String get loginUrl => '$baseUrl$_apiPrefix/auth/login';
  static String get refreshUrl => '$baseUrl$_apiPrefix/auth/refresh';
  static String get logoutUrl => '$baseUrl$_apiPrefix/auth/logout';
  static String get profileUrl => '$baseUrl$_apiPrefix/auth/me';

  // OAuth endpoints
  static String get googleOAuthUrl => '$baseUrl$_apiPrefix/auth/google';
  static String get facebookOAuthUrl => '$baseUrl$_apiPrefix/auth/facebook';

  // Zodiac endpoints
  static String get zodiacDataUrl => '$baseUrl$_apiPrefix/zodiac';
  static String get horoscopeUrl => '$baseUrl$_apiPrefix/horoscope';

  // Tarot endpoints
  static String get tarotDataUrl => '$baseUrl$_apiPrefix/tarot';

  // Natal charts endpoints
  static String get natalChartsUrl => '$baseUrl$_apiPrefix/natal-charts';

  // User profiles endpoints
  static String get userProfilesUrl => '$baseUrl$_apiPrefix/user-profiles';

  /// Default headers for API requests
  static Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  /// Headers with authentication token
  static Map<String, String> authHeaders(String token) => {
    ...defaultHeaders,
    'Authorization': 'Bearer $token',
  };
}
