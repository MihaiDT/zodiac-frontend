import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dio_client.dart';

// Simple API client focused on authentication
class ZodiacApi {
  final DioClient _client;

  ZodiacApi(this._client);

  // Auth endpoints for basic functionality - matching API documentation
  Future<Map<String, dynamic>> register(Map<String, dynamic> request) async {
    try {
      final response = await _client.post('/api/auth/register', data: request);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> request) async {
    try {
      final response = await _client.post('/api/auth/login', data: request);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> refreshToken(
    Map<String, dynamic> request,
  ) async {
    try {
      final response = await _client.post('/api/auth/refresh', data: request);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getProfile() async {
    try {
      final response = await _client.get('/api/auth/me');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout([String? refreshToken]) async {
    try {
      final data =
          refreshToken != null
              ? {'refreshToken': refreshToken}
              : <String, dynamic>{};
      await _client.post('/api/auth/logout', data: data);
    } catch (e) {
      // Don't rethrow logout errors - local logout should always succeed
      print('⚠️ Server logout error (continuing with local logout): $e');
    }
  }
}

// Providers
final dioClientProvider = Provider<DioClient>((ref) => DioClient(ref));

final zodiacApiProvider = Provider<ZodiacApi>((ref) {
  final client = ref.watch(dioClientProvider);
  return ZodiacApi(client);
});
