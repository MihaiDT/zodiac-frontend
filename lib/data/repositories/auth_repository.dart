import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/network/dio_provider.dart';
import '../../core/models/onboarding_models.dart';

abstract class AuthRepository {
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    required ProfileData profile,
  });

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });

  Future<void> logout();
  Future<bool> isLoggedIn();
}

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final FlutterSecureStorage _storage;

  AuthRepositoryImpl(this._dio, this._storage);

  @override
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    required ProfileData profile,
  }) async {
    try {
      // Convert ProfileData to the comprehensive format expected by backend
      final profileData = <String, dynamic>{
        // Birth data - both new and legacy formats for compatibility
        'birthDate': profile.birthDate,
        'birth_date': profile.birthDate, // legacy support
        if (profile.birthTime != null) 'birthTime': profile.birthTime,
        if (profile.birthTime != null)
          'birth_time': profile.birthTime, // legacy support
        if (profile.birthPlace != null) 'birthPlace': profile.birthPlace,
        if (profile.birthPlace != null)
          'birth_place': profile.birthPlace, // legacy support
        if (profile.zodiacSign != null) 'zodiacSign': profile.zodiacSign,
        if (profile.zodiacSign != null)
          'zodiac_sign': profile.zodiacSign, // legacy support
        // Settings object for preferences
        'settings': <String, dynamic>{
          if (profile.tone != null) 'tone': profile.tone,
          if (profile.notifications != null)
            'notifications': profile.notifications!.toJson(),
          if (profile.timezone != null) 'timezone': profile.timezone,
          // Also add selected_intents in settings for better organization
          if (profile.selectedIntents.isNotEmpty)
            'selectedIntents': profile.selectedIntents,
          if (profile.selectedIntents.isNotEmpty)
            'selected_intents': profile.selectedIntents,
        },

        // Onboarding data
        if (profile.selectedIntents.isNotEmpty)
          'selectedIntents': profile.selectedIntents,
        if (profile.selectedIntents.isNotEmpty)
          'selected_intents': profile.selectedIntents, // alternative naming
        // Onboarding tracking
        'onboarding': {
          'completed': true,
          'completedAt': DateTime.now().toIso8601String(),
          'interests': profile.selectedIntents,
          'hasSelectedIntents': profile.selectedIntents.isNotEmpty,
        },
      };

      final response = await _dio.post(
        '/api/auth/register',
        data: {
          'email': email,
          'password': password,
          if (firstName != null) 'firstName': firstName,
          if (lastName != null) 'lastName': lastName,
          'profile': profileData,
        },
      );

      if (response.statusCode == 201 && response.data['success'] == true) {
        final data = response.data['data'];
        final tokens = data['tokens'];

        await _storage.write(key: 'access_token', value: tokens['accessToken']);

        // Only save refresh token if it exists
        if (tokens['refreshToken'] != null) {
          await _storage.write(
            key: 'refresh_token',
            value: tokens['refreshToken'],
          );
        }

        return data;
      } else {
        throw Exception('Registration failed: ${response.data['message']}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw Exception('Email already exists');
      }
      throw Exception('Registration failed: ${e.message}');
    }
  }

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/api/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final data = response.data['data'];
        final tokens = data['tokens'];

        await _storage.write(key: 'access_token', value: tokens['accessToken']);

        // Only save refresh token if it exists
        if (tokens['refreshToken'] != null) {
          await _storage.write(
            key: 'refresh_token',
            value: tokens['refreshToken'],
          );
        }

        return data;
      } else {
        throw Exception('Login failed: ${response.data['message']}');
      }
    } on DioException catch (e) {
      throw Exception('Login failed: ${e.message}');
    }
  }

  @override
  Future<void> logout() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
  }

  @override
  Future<bool> isLoggedIn() async {
    final accessToken = await _storage.read(key: 'access_token');
    return accessToken != null;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(dioProvider);
  final storage = ref.read(secureStorageProvider);
  return AuthRepositoryImpl(dio, storage);
});
