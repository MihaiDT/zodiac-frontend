import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;
  final Dio _dio;

  AuthInterceptor(this._storage, this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final accessToken = await _storage.read(key: 'access_token');
      if (accessToken != null) {
        print('🔑 Added Authorization header for: ${options.path}');
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    } catch (e) {
      print('⚠️ Error reading access token from secure storage: $e');
      // Continue without token if storage fails
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          // Retry original request
          final options = err.requestOptions;
          final accessToken = await _storage.read(key: 'access_token');
          options.headers['Authorization'] = 'Bearer $accessToken';

          final response = await _dio.request(
            options.path,
            options: Options(method: options.method, headers: options.headers),
            data: options.data,
            queryParameters: options.queryParameters,
          );

          handler.resolve(response);
          return;
        }
      } catch (e) {
        // Refresh failed, clear tokens
        await _clearTokens();
      }
    }
    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _storage.read(key: 'refresh_token');
      if (refreshToken == null) return false;

      final response = await _dio.post(
        '/api/auth/refresh',
        data: {'refreshToken': refreshToken},
        options: Options(headers: {'Authorization': null}),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final data = response.data['data'];
        await _storage.write(key: 'access_token', value: data['accessToken']);
        await _storage.write(key: 'refresh_token', value: data['refreshToken']);
        return true;
      }
      return false;
    } catch (e) {
      print('⚠️ Error refreshing token: $e');
      return false;
    }
  }

  Future<void> _clearTokens() async {
    try {
      await _storage.delete(key: 'access_token');
      await _storage.delete(key: 'refresh_token');
    } catch (e) {
      print('⚠️ Error clearing tokens: $e');
    }
  }
}
