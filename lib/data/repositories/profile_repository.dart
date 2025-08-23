import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../core/models/onboarding_models.dart';

abstract class ProfileRepository {
  Future<void> updateProfile(ProfileUpdateRequest request);
  Future<Map<String, dynamic>> getProfile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final Dio _dio;

  ProfileRepositoryImpl(this._dio);

  @override
  Future<void> updateProfile(ProfileUpdateRequest request) async {
    try {
      final response = await _dio.put('/api/profiles', data: request.toJson());

      if (response.statusCode != 200 || response.data['success'] != true) {
        throw Exception(
          'Failed to update profile: ${response.data['message']}',
        );
      }
    } on DioException catch (e) {
      throw Exception('Failed to update profile: ${e.message}');
    }
  }

  @override
  Future<Map<String, dynamic>> getProfile() async {
    try {
      final response = await _dio.get('/api/profiles/me');

      if (response.statusCode == 200 && response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception('Failed to get profile');
      }
    } on DioException catch (e) {
      throw Exception('Failed to get profile: ${e.message}');
    }
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final dio = ref.read(dioProvider);
  return ProfileRepositoryImpl(dio);
});
