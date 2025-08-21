import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';

import '../../../data/api/zodiac_api.dart';
import '../../../data/services/secure_storage_service.dart';
import '../models/user.dart';
import '../models/auth_response.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';

/// Repository for authentication operations
class AuthRepository {
  final ZodiacApi _api;
  final FlutterSecureStorage _secureStorage;

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';

  AuthRepository(this._api, this._secureStorage);

  /// Login with email and password
  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final requestData = {
        'email': request.email,
        'password': request.password,
      };

      final responseData = await _api.login(requestData);

      // Parse the server response structure
      // Based on the actual API response: {success: true, message: "login successful", data: {user: {...}}}
      final userData = responseData['data']['user'];

      // Create a mock token since the API doesn't return one
      // In a real scenario, you'd get this from the API response
      const mockToken = 'authenticated_user_token';

      // Create AuthResponse object manually from the server response
      final authResponse = AuthResponse(
        accessToken: mockToken,
        refreshToken: mockToken,
        user: User.fromJson(userData),
        tokenType: 'Bearer',
      );

      // Store tokens securely
      await _storeTokens(authResponse.accessToken, authResponse.refreshToken);

      // Store user data
      await SecureStorageService.write(
        key: _userKey,
        value: authResponse.user.toJsonString(),
      );

      return authResponse;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Register new user
  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      // Adapt the request structure to match API documentation
      final requestData = {
        'email': request.email,
        'password': request.password,
        'firstName': request.name.split(' ').first,
        'lastName':
            request.name.split(' ').length > 1
                ? request.name.split(' ').sublist(1).join(' ')
                : request.name.split(' ').first,
        if (request.birthDate != null)
          'profile': {
            'birthDate': request.birthDate!.toIso8601String().split('T')[0],
          },
      };

      final responseData = await _api.register(requestData);

      // Parse the server response structure
      final userData = responseData['data']['user'];
      final tokensData = responseData['data']['tokens'];

      // Create AuthResponse object manually from the server response
      final authResponse = AuthResponse(
        accessToken: tokensData['accessToken'] as String,
        refreshToken: tokensData['refreshToken'] as String,
        user: User.fromJson(userData),
        tokenType: tokensData['tokenType'] as String?,
      );

      // Store tokens securely
      await _storeTokens(authResponse.accessToken, authResponse.refreshToken);

      // Store user data
      await SecureStorageService.write(
        key: _userKey,
        value: authResponse.user.toJsonString(),
      );

      return authResponse;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Refresh access token
  Future<String> refreshToken() async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null) {
      throw AuthException('No refresh token available');
    }

    try {
      final requestData = {'refreshToken': refreshToken};
      final responseData = await _api.refreshToken(requestData);

      final newAccessToken = responseData['accessToken'] as String;
      final newRefreshToken = responseData['refreshToken'] as String?;

      // Store new tokens
      await SecureStorageService.write(
        key: _accessTokenKey,
        value: newAccessToken,
      );
      if (newRefreshToken != null) {
        await SecureStorageService.write(
          key: _refreshTokenKey,
          value: newRefreshToken,
        );
      }

      return newAccessToken;
    } catch (e) {
      // If refresh fails, clear all tokens
      await logout();
      throw _handleError(e);
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      // Try to logout on server
      await _api.logout();
    } catch (e) {
      // Continue with local logout even if server request fails
    }

    // Clear all stored data
    await _clearStoredData();
  }

  /// Get stored access token
  Future<String?> getAccessToken() async {
    return await SecureStorageService.read(key: _accessTokenKey);
  }

  /// Get stored refresh token
  Future<String?> getRefreshToken() async {
    return await SecureStorageService.read(key: _refreshTokenKey);
  }

  /// Get stored user data
  Future<User?> getStoredUser() async {
    final userData = await SecureStorageService.read(key: _userKey);
    if (userData != null) {
      return UserExtensions.fromJsonString(userData);
    }
    return null;
  }

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    final accessToken = await getAccessToken();
    return accessToken != null;
  }

  /// Initialize auth state on app startup
  Future<User?> initializeAuth() async {
    try {
      final accessToken = await getAccessToken();
      if (accessToken == null) return null;

      // Try to get current user from server
      final responseData = await _api.getProfile();
      final user = User.fromJson(responseData['data']['user']);

      // Update stored user data
      await SecureStorageService.write(
        key: _userKey,
        value: user.toJsonString(),
      );

      return user;
    } catch (e) {
      // If getting user fails, try with stored user data
      return await getStoredUser();
    }
  }

  /// Store tokens securely
  Future<void> _storeTokens(String accessToken, String refreshToken) async {
    await Future.wait([
      SecureStorageService.write(key: _accessTokenKey, value: accessToken),
      SecureStorageService.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  /// Clear all stored authentication data
  Future<void> _clearStoredData() async {
    await Future.wait([
      SecureStorageService.delete(key: _accessTokenKey),
      SecureStorageService.delete(key: _refreshTokenKey),
      SecureStorageService.delete(key: _userKey),
    ]);
  }

  /// Handle errors and convert to appropriate exceptions
  Exception _handleError(dynamic e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return AuthException(
            'Connection timeout. Please check your internet connection.',
          );

        case DioExceptionType.badResponse:
          final statusCode = e.response?.statusCode;
          final message =
              e.response?.data?['message'] ?? 'Authentication failed';

          switch (statusCode) {
            case 400:
              return AuthException('Invalid request: $message');
            case 401:
              return AuthException('Invalid credentials');
            case 403:
              return AuthException('Access forbidden');
            case 404:
              return AuthException('Service not found');
            case 422:
              return ValidationException(message);
            case 500:
              return AuthException('Server error. Please try again later.');
            default:
              return AuthException(message);
          }

        case DioExceptionType.cancel:
          return AuthException('Request was cancelled');

        case DioExceptionType.connectionError:
          return AuthException(
            'Connection error. Please check your internet connection.',
          );

        default:
          return AuthException('An unexpected error occurred: ${e.message}');
      }
    }

    // For other types of errors
    return AuthException('An unexpected error occurred: ${e.toString()}');
  }
}

/// Authentication related exceptions
class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}

/// Validation related exceptions
class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);

  @override
  String toString() => 'ValidationException: $message';
}

/// Provider for FlutterSecureStorage
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );
});

/// Provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.watch(zodiacApiProvider);
  final secureStorage = ref.watch(secureStorageProvider);

  return AuthRepository(api, secureStorage);
});
