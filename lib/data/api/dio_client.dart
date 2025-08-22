import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/foundation.dart';

import '../../main.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

/// Dio HTTP client configuration
class DioClient {
  late final Dio _dio;
  final Ref? _ref;

  DioClient([this._ref]) {
    _dio = Dio();
    _setupInterceptors();
    _setupBaseOptions();
  }

  /// Get the configured Dio instance
  Dio get dio => _dio;

  /// Setup base configuration
  void _setupBaseOptions() {
    _dio.options = BaseOptions(
      baseUrl: Environment.apiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      validateStatus: (status) {
        // Accept status codes for manual handling, but allow 401 to trigger interceptor
        return status != null && status >= 200 && status < 300;
      },
    );
  }

  /// Setup interceptors
  void _setupInterceptors() {
    // Auth interceptor (handles token injection and refresh)
    _dio.interceptors.add(AuthInterceptor(_ref));

    // Logging interceptor (only in debug mode)
    if (kDebugMode) {
      _dio.interceptors.add(LoggingInterceptor());
    }

    // Retry interceptor for network errors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          if (_shouldRetry(error)) {
            try {
              final response = await _retry(error.requestOptions);
              handler.resolve(response);
            } catch (e) {
              handler.next(error);
            }
          } else {
            handler.next(error);
          }
        },
      ),
    );
  }

  /// Check if request should be retried
  bool _shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        (error.response?.statusCode != null &&
            error.response!.statusCode! >= 500);
  }

  /// Retry failed request
  Future<Response> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  /// GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// PATCH request
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Handle Dio errors and convert to custom exceptions
  Exception _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          'Connection timeout. Please check your internet connection.',
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = _extractErrorMessage(error.response?.data);

        switch (statusCode) {
          case 400:
            return BadRequestException(message);
          case 401:
            return UnauthorizedException(message);
          case 403:
            return ForbiddenException(message);
          case 404:
            return NotFoundException(message);
          case 409:
            return ConflictException(message);
          case 422:
            return ValidationException(message);
          case 500:
            return ServerException(message);
          default:
            return HttpException(statusCode ?? 0, message);
        }

      case DioExceptionType.cancel:
        return RequestCancelledException('Request was cancelled');

      case DioExceptionType.connectionError:
        return NetworkException('No internet connection');

      default:
        return UnknownException(
          'An unexpected error occurred: ${error.message}',
        );
    }
  }

  /// Extract error message from response
  String _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] ??
          data['error'] ??
          data['detail'] ??
          'An error occurred';
    }
    return 'An error occurred';
  }
}

// Custom exception classes
abstract class ApiException implements Exception {
  final String message;
  const ApiException(this.message);

  @override
  String toString() => 'ApiException: $message';
}

class NetworkException extends ApiException {
  const NetworkException(super.message);
}

class BadRequestException extends ApiException {
  const BadRequestException(super.message);
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException(super.message);
}

class ForbiddenException extends ApiException {
  const ForbiddenException(super.message);
}

class NotFoundException extends ApiException {
  const NotFoundException(super.message);
}

class ConflictException extends ApiException {
  const ConflictException(super.message);
}

class ValidationException extends ApiException {
  const ValidationException(super.message);
}

class ServerException extends ApiException {
  const ServerException(super.message);
}

class HttpException extends ApiException {
  final int statusCode;
  const HttpException(this.statusCode, super.message);

  @override
  String toString() => 'HttpException($statusCode): $message';
}

class RequestCancelledException extends ApiException {
  const RequestCancelledException(super.message);
}

class UnknownException extends ApiException {
  const UnknownException(super.message);
}
