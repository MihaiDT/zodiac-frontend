import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

/// HTTP API Service for Zodiac AI App
/// Handles all HTTP requests to the backend API
class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final http.Client _client = http.Client();

  /// Make a GET request
  Future<http.Response> get(String endpoint, {String? token}) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$endpoint');
    final headers = token != null
        ? ApiConfig.authHeaders(token)
        : ApiConfig.defaultHeaders;

    print('🌐 GET: $uri');
    return await _client.get(uri, headers: headers);
  }

  /// Make a POST request
  Future<http.Response> post(
    String endpoint, {
    Map<String, dynamic>? body,
    String? token,
  }) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$endpoint');
    final headers = token != null
        ? ApiConfig.authHeaders(token)
        : ApiConfig.defaultHeaders;

    print('🌐 POST: $uri');
    return await _client.post(
      uri,
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
  }

  /// Make a PUT request
  Future<http.Response> put(
    String endpoint, {
    Map<String, dynamic>? body,
    String? token,
  }) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$endpoint');
    final headers = token != null
        ? ApiConfig.authHeaders(token)
        : ApiConfig.defaultHeaders;

    print('🌐 PUT: $uri');
    return await _client.put(
      uri,
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
  }

  /// Make a DELETE request
  Future<http.Response> delete(String endpoint, {String? token}) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$endpoint');
    final headers = token != null
        ? ApiConfig.authHeaders(token)
        : ApiConfig.defaultHeaders;

    print('🌐 DELETE: $uri');
    return await _client.delete(uri, headers: headers);
  }

  /// Parse JSON response
  Map<String, dynamic> parseResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw ApiException(
        response.statusCode,
        jsonDecode(response.body)['message'] ?? 'Unknown error',
      );
    }
  }

  /// Dispose resources
  void dispose() {
    _client.close();
  }
}

/// API Exception class
class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() => 'ApiException($statusCode): $message';
}
