import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Logging interceptor for HTTP requests (debug mode only)
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('🌐 ${options.method} ${options.uri}');
      if (options.data != null) {
        debugPrint('📤 Request Data: ${options.data}');
      }
      if (options.queryParameters.isNotEmpty) {
        debugPrint('🔍 Query Parameters: ${options.queryParameters}');
      }
      debugPrint('📝 Headers: ${options.headers}');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('✅ ${response.statusCode} ${response.requestOptions.uri}');
      debugPrint('📥 Response Data: ${response.data}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        '❌ ${err.response?.statusCode ?? 'Unknown'} ${err.requestOptions.uri}',
      );
      debugPrint('💥 Error: ${err.message}');
      if (err.response?.data != null) {
        debugPrint('📥 Error Response: ${err.response?.data}');
      }
    }
    handler.next(err);
  }
}
