import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/foundation.dart';

import '../../../main.dart';
import '../../services/secure_storage_service.dart';

/// Authentication interceptor for handling JWT tokens
class AuthInterceptor extends Interceptor {
  final Ref? _ref;

  // Token storage keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  // Flag to prevent infinite refresh loops
  bool _isRefreshing = false;

  AuthInterceptor([this._ref]);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip token injection for auth endpoints
    if (_isAuthEndpoint(options.path)) {
      handler.next(options);
      return;
    }

    // Get access token from secure storage
    final accessToken = await SecureStorageService.read(key: _accessTokenKey);

    if (accessToken != null && accessToken.isNotEmpty) {
      // Add Bearer token to headers
      options.headers['Authorization'] = 'Bearer $accessToken';

      if (kDebugMode) {
        debugPrint('🔑 Added Authorization header for: ${options.path}');
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized errors
    if (err.response?.statusCode == 401) {
      if (kDebugMode) {
        debugPrint('🚫 401 Unauthorized - attempting token refresh');
      }

      try {
        // Attempt to refresh the token
        final newTokens = await _refreshToken();

        if (newTokens != null) {
          // Retry the original request with new token
          final response = await _retryRequest(
            err.requestOptions,
            newTokens['accessToken'],
          );
          handler.resolve(response);
          return;
        }
      } catch (e) {
        if (kDebugMode) {
          debugPrint('❌ Token refresh failed: $e');
        }
      }
      
      // If refresh fails or returns null, clear tokens and let the error propagate
      await _clearTokens();
      if (kDebugMode) {
        debugPrint('🗑️ Tokens cleared due to refresh failure');
      }
    }

    handler.next(err);
  }

  /// Check if the endpoint is an authentication endpoint
  bool _isAuthEndpoint(String path) {
    final authPaths = [
      '/api/auth/login',
      '/api/auth/register',
      '/api/auth/refresh',
      '/api/auth/logout',
    ];

    return authPaths.any((authPath) => path.contains(authPath));
  }

  /// Refresh the access token using refresh token
  Future<Map<String, dynamic>?> _refreshToken() async {
    if (_isRefreshing) {
      // Wait for the ongoing refresh to complete
      await Future.delayed(const Duration(milliseconds: 100));
      return null;
    }

    _isRefreshing = true;

    try {
      final refreshToken = await SecureStorageService.read(
        key: _refreshTokenKey,
      );

      if (refreshToken == null || refreshToken.isEmpty) {
        if (kDebugMode) {
          debugPrint('❌ No refresh token available');
        }
        return null;
      }

      if (kDebugMode) {
        debugPrint('🔄 Attempting to refresh token...');
      }

      // Create a new Dio instance to avoid interceptor loops
      final dio = Dio();
      dio.options.baseUrl = Environment.apiBaseUrl;

      final response = await dio.post(
        '/api/auth/refresh',
        data: {'refreshToken': refreshToken},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        debugPrint('📥 Refresh response: ${response.statusCode} - ${response.data}');
      }

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        
        // Handle different response structures
        final data = responseData['data'] ?? responseData;
        final newAccessToken = data['accessToken'] as String?;
        final newRefreshToken = data['refreshToken'] as String?;

        if (newAccessToken != null && newRefreshToken != null) {
          // Store new tokens
          await SecureStorageService.write(
            key: _accessTokenKey,
            value: newAccessToken,
          );
          await SecureStorageService.write(
            key: _refreshTokenKey,
            value: newRefreshToken,
          );

          if (kDebugMode) {
            debugPrint('✅ Token refresh successful');
          }

          return {
            'accessToken': newAccessToken,
            'refreshToken': newRefreshToken,
          };
        } else {
          if (kDebugMode) {
            debugPrint('❌ Missing tokens in refresh response');
          }
        }
      } else {
        if (kDebugMode) {
          debugPrint('❌ Refresh failed with status: ${response.statusCode}');
        }
      }
    } on DioException catch (dioError) {
      if (kDebugMode) {
        final statusCode = dioError.response?.statusCode;
        if (statusCode == 401 || statusCode == 403) {
          debugPrint('❌ Refresh token is invalid or expired (${statusCode})');
        } else if (statusCode == 500) {
          debugPrint('❌ Refresh token server error (500) - possibly expired refresh token');
        } else {
          debugPrint('❌ Token refresh error: ${dioError.response?.statusCode} - ${dioError.message}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('❌ Token refresh error: $e');
      }
    } finally {
      _isRefreshing = false;
    }

    return null;
  }

  /// Retry the original request with new access token
  Future<Response> _retryRequest(
    RequestOptions requestOptions,
    String newAccessToken,
  ) async {
    // Update the authorization header
    requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

    // Create a new Dio instance for token refresh to avoid interceptor loops
    final dio = Dio();
    if (_ref != null) {
      dio.options.baseUrl = Environment.apiBaseUrl;
    } else {
      dio.options.baseUrl =
          'https://zodiac-api-gmapemgtc7dkasg5.centralus-01.azurewebsites.net';
    }

    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return await dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  /// Clear all stored tokens
  Future<void> _clearTokens() async {
    await SecureStorageService.delete(key: _accessTokenKey);
    await SecureStorageService.delete(key: _refreshTokenKey);

    if (kDebugMode) {
      debugPrint('🗑️ Tokens cleared');
    }
  }

  /// Save tokens to secure storage
  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      SecureStorageService.write(key: _accessTokenKey, value: accessToken),
      SecureStorageService.write(key: _refreshTokenKey, value: refreshToken),
    ]);

    if (kDebugMode) {
      debugPrint('💾 Tokens saved');
    }
  }

  /// Get access token from storage
  static Future<String?> getAccessToken() async {
    return await SecureStorageService.read(key: _accessTokenKey);
  }

  /// Get refresh token from storage
  static Future<String?> getRefreshToken() async {
    return await SecureStorageService.read(key: _refreshTokenKey);
  }

  /// Check if user has valid tokens
  static Future<bool> hasValidTokens() async {
    final accessToken = await SecureStorageService.read(key: _accessTokenKey);
    final refreshToken = await SecureStorageService.read(key: _refreshTokenKey);

    return accessToken != null &&
        accessToken.isNotEmpty &&
        refreshToken != null &&
        refreshToken.isNotEmpty;
  }
}
