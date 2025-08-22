import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/api/dio_client.dart';
import '../../../data/api/zodiac_api.dart';
import '../models/numerology.dart';

class NumerologyApiService {
  final DioClient _client;

  NumerologyApiService(this._client);

  Future<KeyFiguresResponse> getKeyFigures(NumerologyRequest request) async {
    try {
      final response = await _client.post(
        '/api/numerology/key-figures',
        data: request.toJson(),
      );
      final data = response.data['data'] ?? response.data;
      return KeyFiguresResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<InterpretationsResponse> getInterpretations() async {
    try {
      final response = await _client.get('/api/numerology/interpretations');
      final data = response.data['data'] ?? response.data;
      return InterpretationsResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}

// Provider
final numerologyApiServiceProvider = Provider<NumerologyApiService>((ref) {
  final client = ref.watch(dioClientProvider);
  return NumerologyApiService(client);
});
