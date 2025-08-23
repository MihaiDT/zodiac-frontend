import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/network/dio_provider.dart';

abstract class NumerologyRepository {
  Future<Map<String, dynamic>> getLifePathNumber(DateTime birthDate);
  Future<Map<String, dynamic>> getKeyFigures({
    required DateTime birthDate,
    String? firstName,
    String? lastName,
  });
}

class NumerologyRepositoryImpl implements NumerologyRepository {
  final Dio _dio;

  NumerologyRepositoryImpl(this._dio);

  @override
  Future<Map<String, dynamic>> getLifePathNumber(DateTime birthDate) async {
    try {
      final formattedDate =
          '${birthDate.year}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}';

      final response = await _dio.get(
        '/api/numerology/life-path-number',
        queryParameters: {'birthdate': formattedDate},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception('Failed to get life path number');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw Exception('Too many requests. Please try again later.');
      }
      throw Exception('Failed to get life path number: ${e.message}');
    }
  }

  @override
  Future<Map<String, dynamic>> getKeyFigures({
    required DateTime birthDate,
    String? firstName,
    String? lastName,
  }) async {
    try {
      final formattedDate =
          '${birthDate.year}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}';

      final data = {
        'birthDate': formattedDate,
        if (firstName != null) 'firstName': firstName,
        if (lastName != null) 'lastName': lastName,
      };

      final response = await _dio.post(
        '/api/numerology/key-figures',
        data: data,
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception('Failed to get key figures');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw Exception('Too many requests. Please try again later.');
      }
      throw Exception('Failed to get key figures: ${e.message}');
    }
  }
}

final numerologyRepositoryProvider = Provider<NumerologyRepository>((ref) {
  final dio = ref.read(dioProvider);
  return NumerologyRepositoryImpl(dio);
});
