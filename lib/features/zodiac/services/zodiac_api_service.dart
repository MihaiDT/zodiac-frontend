import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/api/dio_client.dart';
import '../../../data/api/zodiac_api.dart';
import '../models/zodiac_sign.dart';

class ZodiacApiService {
  final DioClient _client;

  ZodiacApiService(this._client);

  Future<List<ZodiacSign>> getAllSigns() async {
    try {
      final response = await _client.get('/api/zodiac/signs');
      
      // Handle nested response structure: {success: true, data: {success: true, data: [...]}}
      dynamic data = response.data;
      
      // First level: response.data
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        data = data['data'];
      }
      
      // Second level: response.data['data']['data']
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        data = data['data'];
      }
      
      // Now data should be a List
      if (data is List) {
        return data.map((json) => ZodiacSign.fromJson(json)).toList();
      } else {
        throw Exception('Expected List but got ${data.runtimeType}: $data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ZodiacSign> getSignDetails(String signId) async {
    try {
      final response = await _client.get('/api/zodiac/signs/$signId');
      
      // Handle nested response structure
      dynamic data = response.data;
      
      // First level: response.data
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        data = data['data'];
      }
      
      // Second level: response.data['data']['data'] (if needed)
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        data = data['data'];
      }
      
      return ZodiacSign.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}

// Provider
final zodiacApiServiceProvider = Provider<ZodiacApiService>((ref) {
  final client = ref.watch(dioClientProvider);
  return ZodiacApiService(client);
});
