import 'package:shared_preferences/shared_preferences.dart';

/// Local storage service for Zodiac AI App
/// Handles secure storage of tokens and user preferences
class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userPreferencesKey = 'user_preferences';

  /// Get SharedPreferences instance
  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  /// Save access token
  Future<void> saveAccessToken(String token) async {
    final prefs = await _prefs;
    await prefs.setString(_accessTokenKey, token);
  }

  /// Get access token
  Future<String?> getAccessToken() async {
    final prefs = await _prefs;
    return prefs.getString(_accessTokenKey);
  }

  /// Save refresh token
  Future<void> saveRefreshToken(String token) async {
    final prefs = await _prefs;
    await prefs.setString(_refreshTokenKey, token);
  }

  /// Get refresh token
  Future<String?> getRefreshToken() async {
    final prefs = await _prefs;
    return prefs.getString(_refreshTokenKey);
  }

  /// Clear all tokens
  Future<void> clearTokens() async {
    final prefs = await _prefs;
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
  }

  /// Save user preferences
  Future<void> saveUserPreferences(Map<String, dynamic> preferences) async {
    final prefs = await _prefs;
    await prefs.setString(_userPreferencesKey, preferences.toString());
  }

  /// Get user preferences
  Future<Map<String, dynamic>?> getUserPreferences() async {
    final prefs = await _prefs;
    final prefsString = prefs.getString(_userPreferencesKey);

    if (prefsString != null) {
      // In a real app, you'd use proper JSON serialization
      // For now, returning an empty map as placeholder
      return <String, dynamic>{};
    }

    return null;
  }

  /// Clear all stored data
  Future<void> clearAll() async {
    final prefs = await _prefs;
    await prefs.clear();
  }

  /// Save a string value
  Future<void> saveString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  /// Get a string value
  Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  /// Save a boolean value
  Future<void> saveBool(String key, bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  /// Get a boolean value
  Future<bool?> getBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key);
  }

  /// Save an integer value
  Future<void> saveInt(String key, int value) async {
    final prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  /// Get an integer value
  Future<int?> getInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }
}
