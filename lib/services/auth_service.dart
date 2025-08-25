import '../services/api_service.dart';
import '../services/storage_service.dart';

/// Authentication service for Zodiac AI App
/// Handles user registration, login, logout, and token management
class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final ApiService _apiService = ApiService();
  final StorageService _storageService = StorageService();

  String? _accessToken;
  String? _refreshToken;
  Map<String, dynamic>? _userProfile;

  /// Check if user is authenticated
  bool get isAuthenticated => _accessToken != null;

  /// Get current access token
  String? get accessToken => _accessToken;

  /// Get current user profile
  Map<String, dynamic>? get userProfile => _userProfile;

  /// Initialize authentication state from storage
  Future<void> init() async {
    _accessToken = await _storageService.getAccessToken();
    _refreshToken = await _storageService.getRefreshToken();

    if (_accessToken != null) {
      await _loadUserProfile();
    }
  }

  /// Register a new user
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await _apiService.post(
      '/api/auth/register',
      body: {'email': email, 'password': password, 'name': name},
    );

    final data = _apiService.parseResponse(response);
    await _saveTokens(data['accessToken'], data['refreshToken']);
    _userProfile = data['user'];

    return data;
  }

  /// Login user
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiService.post(
      '/api/auth/login',
      body: {'email': email, 'password': password},
    );

    final data = _apiService.parseResponse(response);
    await _saveTokens(data['accessToken'], data['refreshToken']);
    _userProfile = data['user'];

    return data;
  }

  /// Logout user
  Future<void> logout() async {
    if (_accessToken != null) {
      try {
        await _apiService.post('/api/auth/logout', token: _accessToken);
      } catch (e) {
        print('Error during logout: $e');
      }
    }

    await _clearTokens();
  }

  /// Refresh access token
  Future<bool> refreshAccessToken() async {
    if (_refreshToken == null) return false;

    try {
      final response = await _apiService.post(
        '/api/auth/refresh',
        body: {'refreshToken': _refreshToken},
      );

      final data = _apiService.parseResponse(response);
      await _saveTokens(data['accessToken'], data['refreshToken']);

      return true;
    } catch (e) {
      print('Error refreshing token: $e');
      await _clearTokens();
      return false;
    }
  }

  /// Load user profile
  Future<void> _loadUserProfile() async {
    try {
      final response = await _apiService.get(
        '/api/auth/me',
        token: _accessToken,
      );

      _userProfile = _apiService.parseResponse(response);
    } catch (e) {
      print('Error loading user profile: $e');
    }
  }

  /// Save tokens to storage
  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;

    await _storageService.saveAccessToken(accessToken);
    await _storageService.saveRefreshToken(refreshToken);
  }

  /// Clear tokens from storage
  Future<void> _clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    _userProfile = null;

    await _storageService.clearTokens();
  }

  /// Set tokens manually for testing/development
  Future<void> setTokensManually(String accessToken, [String? refreshToken]) async {
    await _saveTokens(accessToken, refreshToken ?? '');
    // Load user profile if possible
    await _loadUserProfile();
  }

  /// Google OAuth login
  Future<Map<String, dynamic>> loginWithGoogle() async {
    // This would integrate with Google Sign-In package
    // For now, just redirect to the OAuth endpoint
    throw UnimplementedError('Google OAuth not implemented yet');
  }

  /// Facebook OAuth login
  Future<Map<String, dynamic>> loginWithFacebook() async {
    // This would integrate with Facebook Login package
    // For now, just redirect to the OAuth endpoint
    throw UnimplementedError('Facebook OAuth not implemented yet');
  }
}
