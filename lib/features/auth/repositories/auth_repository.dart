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
      // Based on the actual API response: {success: true, message: "login successful", data: {user: {...}, tokens: {...}}}
      final data = responseData['data'];
      if (data == null) {
        throw Exception('Invalid response: missing data field');
      }

      final userData = data['user'];
      final tokensData = data['tokens'];

      if (userData == null) {
        throw Exception('Invalid response: missing user data');
      }

      if (tokensData == null) {
        throw Exception('Invalid response: missing tokens data');
      }

      // Extract tokens from the API response
      final accessToken = tokensData['accessToken'] as String?;
      final refreshTokenData = tokensData['refreshToken'];
      final refreshToken =
          refreshTokenData is String
              ? refreshTokenData
              : refreshTokenData?['token'] as String?;

      if (accessToken == null || refreshToken == null) {
        throw Exception('Invalid response: missing token data');
      }

      // Create AuthResponse object from the server response
      final authResponse = AuthResponse(
        accessToken: accessToken,
        refreshToken: refreshToken,
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
      print('🔍 Full response data: $responseData');
      final userData = responseData['data']['user'];
      final tokensData = responseData['data']['tokens'];

      print('🔍 User data: $userData');
      print('🔍 Tokens data: $tokensData');

      // Create AuthResponse object manually from the server response
      final accessToken = tokensData['accessToken'] as String;

      // Handle refreshToken - it can be a String or an Object with token field
      String refreshToken = '';
      final refreshTokenData = tokensData['refreshToken'];
      if (refreshTokenData is String) {
        refreshToken = refreshTokenData;
      } else if (refreshTokenData is Map<String, dynamic> &&
          refreshTokenData['token'] != null) {
        refreshToken = refreshTokenData['token'] as String;
      }

      final authResponse = AuthResponse(
        accessToken: accessToken,
        refreshToken: refreshToken,
        user: User.fromJson(userData),
        tokenType: tokensData['tokenType'] as String? ?? 'Bearer',
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
      // Get refresh token for server logout
      final refreshToken = await getRefreshToken();

      // Try to logout on server with a timeout
      await _api
          .logout(refreshToken)
          .timeout(
            const Duration(seconds: 5),
            onTimeout: () {
              // Timeout - continue with local logout
              print('⚠️ Logout server timeout - continuing with local logout');
              return;
            },
          );
    } catch (e) {
      // Continue with local logout even if server request fails
      // This ensures the user can always logout locally
      print('⚠️ Server logout failed (continuing with local logout): $e');
    }

    // Always clear all stored data regardless of server response
    await _clearStoredData();
  }

  /// Get current user information from API
  Future<User?> getCurrentUser() async {
    try {
      final token = await getAccessToken();
      if (token == null) {
        print('❌ No access token available');
        return null;
      }

      print('🔍 Fetching current user from API...');
      final responseData = await _api.getProfile();
      
      // Parse response based on API structure
      final data = responseData['data'];
      if (data == null) {
        print('❌ No user data in response');
        return null;
      }

      final user = User.fromJson(data);
      print('✅ Current user fetched successfully: ${user.email}');
      
      return user;
    } catch (e) {
      print('❌ Error fetching current user: $e');
      return null;
    }
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
      if (accessToken == null) {
        print('🔐 No access token found, user not authenticated');
        return null;
      }

      print('🔐 Found access token, verifying with server...');
      
      // Try to get current user from server
      final responseData = await _api.getProfile();
      final userData = responseData['data'];
      
      if (userData == null) {
        print('❌ Invalid response from server, clearing tokens');
        await _clearStoredData();
        return null;
      }
      
      final user = User.fromJson(userData);
      print('✅ User verified successfully: ${user.email}');

      // Update stored user data
      await SecureStorageService.write(
        key: _userKey,
        value: user.toJsonString(),
      );

      return user;
    } catch (e) {
      print('❌ Auth verification failed: $e');
      
      // If server verification fails, clear invalid tokens
      await _clearStoredData();
      
      // Try with stored user data as fallback (offline mode)
      final storedUser = await getStoredUser();
      if (storedUser != null) {
        print('📱 Using offline stored user data');
      }
      
      return storedUser;
    }
  }

  /// Store tokens securely
  Future<void> _storeTokens(String accessToken, String refreshToken) async {
    final futures = <Future<void>>[
      SecureStorageService.write(key: _accessTokenKey, value: accessToken),
    ];

    // Only store refresh token if it's not empty
    if (refreshToken.isNotEmpty) {
      futures.add(
        SecureStorageService.write(key: _refreshTokenKey, value: refreshToken),
      );
    }

    await Future.wait(futures);
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
          final responseData = e.response?.data;
          final message = responseData?['message'] ?? 'Authentication failed';
          final errorType = responseData?['error'];

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
            case 429:
              final retryAfter = responseData?['details']?['retryAfter'];
              final waitTime =
                  retryAfter != null
                      ? '${(retryAfter / 60).ceil()} minutes'
                      : 'a few minutes';
              return AuthException(
                'Too many login attempts. Please try again in $waitTime.',
              );
            case 500:
              // Handle specific server errors for login
              if (errorType == 'internal_error' &&
                  message.toLowerCase().contains('invalid email or password')) {
                return AuthException(
                  'Invalid email or password. Please check your credentials.',
                );
              }
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
