import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/api/dio_client.dart';
import '../../../data/api/zodiac_api.dart';
import '../models/profile.dart';

class ProfileApiService {
  final DioClient _client;

  ProfileApiService(this._client);

  Future<UserProfile> getProfile() async {
    try {
      final response = await _client.get('/api/profiles/me');

      // Check if the response is successful
      if (response.statusCode != 200) {
        throw Exception('Failed to load profile: ${response.statusCode}');
      }

      final data = response.data['data'] ?? response.data;

      // Validate that we have the required profile data
      if (data == null ||
          data['id'] == null ||
          data['email'] == null ||
          data['name'] == null) {
        throw Exception('Invalid profile data received from server');
      }

      // Map the API response to our frontend model structure
      final mappedData = <String, dynamic>{
        'id': data['id'],
        'email': data['email'],
        'name': data['name'],
        'firstName': data['firstName'] ?? _extractFirstName(data['name']),
        'lastName': data['lastName'] ?? _extractLastName(data['name']),
        'birthdate': data['birthdate'],
        'zodiacSign': data['zodiacSign'],
        'avatar': data['avatar'],
        'createdAt': data['created_at'] ?? data['createdAt'],
        'updatedAt': data['updated_at'] ?? data['updatedAt'],
        'settings': _mapSettingsData(data),
      };

      return UserProfile.fromJson(mappedData);
    } catch (e) {
      rethrow;
    }
  }

  // Helper method to extract first name from full name
  String _extractFirstName(String? fullName) {
    if (fullName == null || fullName.isEmpty) return 'User';
    final parts = fullName.split(' ');
    return parts.isNotEmpty ? parts.first : 'User';
  }

  // Helper method to extract last name from full name
  String _extractLastName(String? fullName) {
    if (fullName == null || fullName.isEmpty) return '';
    final parts = fullName.split(' ');
    return parts.length > 1 ? parts.skip(1).join(' ') : '';
  }

  // Helper method to map settings data from API to frontend model
  Map<String, dynamic> _mapSettingsData(Map<String, dynamic> data) {
    // Get settings from the API response
    final apiSettings = data['settings'] as Map<String, dynamic>? ?? {};
    final apiNotifications =
        data['notifications'] as Map<String, dynamic>? ??
        apiSettings['notifications'] as Map<String, dynamic>? ??
        {};

    // Map to our frontend structure
    return {
      'horoscopeTone': data['tone'] ?? apiSettings['tone'] ?? 'serious',
      'analyticsEnabled': apiSettings['analyticsEnabled'] ?? true,
      'language': apiSettings['language'] ?? 'en',
      'timezone': data['timezone'] ?? apiSettings['timezone'] ?? 'UTC',
      'notifications': {
        'dailyHoroscope':
            apiNotifications['daily'] ??
            apiNotifications['dailyHoroscope'] ??
            true,
        'weeklyForecast':
            apiNotifications['weekly'] ??
            apiNotifications['weeklyForecast'] ??
            true,
        'monthlyInsights':
            apiNotifications['monthly'] ??
            apiNotifications['monthlyInsights'] ??
            true,
        'numerologyUpdates':
            apiNotifications['numerology'] ??
            apiNotifications['numerologyUpdates'] ??
            true,
        'specialEvents':
            apiNotifications['special'] ??
            apiNotifications['specialEvents'] ??
            true,
      },
    };
  }

  Future<UserProfile> updateProfile(ProfileUpdateRequest request) async {
    try {
      final response = await _client.put(
        '/api/profiles',
        data: request.toJson(),
      );
      final data = response.data['data'] ?? response.data;
      return UserProfile.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}

// Provider
final profileApiServiceProvider = Provider<ProfileApiService>((ref) {
  final client = ref.watch(dioClientProvider);
  return ProfileApiService(client);
});
