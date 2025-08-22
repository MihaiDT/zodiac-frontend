import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/api/dio_client.dart';
import '../../../data/api/zodiac_api.dart';
import '../models/horoscope.dart';

class HoroscopeApiService {
  final DioClient _client;

  HoroscopeApiService(this._client);

  Future<HoroscopeResponse> getHoroscope({
    required String sign,
    required HoroscopeTone tone,
  }) async {
    try {
      final response = await _client.get(
        '/api/horoscope/$sign',
        queryParameters: {'tone': tone.name},
      );
      final data = response.data['data'] ?? response.data;
      return HoroscopeResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}

// Provider
final horoscopeApiServiceProvider = Provider<HoroscopeApiService>((ref) {
  final client = ref.watch(dioClientProvider);
  return HoroscopeApiService(client);
});
