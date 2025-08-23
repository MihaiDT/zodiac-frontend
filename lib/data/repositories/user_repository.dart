import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_birth_data.dart';
import './auth_repository.dart';

class UserRepository {
  static const String _baseUrl =
      'https://zodiac-api-gmapemgtc7dkasg5.centralus-01.azurewebsites.net/api';
  final AuthRepository _authRepo = AuthRepository();

  Future<UserProfileResult> submitBirthData(UserBirthData birthData) async {
    try {
      final accessToken = await _authRepo.getAccessToken();
      if (accessToken == null) {
        throw Exception('No access token available');
      }

      print(
        'Submitting birth data with token: ${accessToken.substring(0, 20)}...',
      );

      final requestBody = {
        'birthdate': birthData.birthDate.toIso8601String().split('T')[0],
        'birthTime':
            birthData.birthTime != null
                ? '${birthData.birthTime!.hour.toString().padLeft(2, '0')}:${birthData.birthTime!.minute.toString().padLeft(2, '0')}'
                : '12:00',
        'birthLocation': {
          'city': birthData.birthPlace ?? 'New York',
          'country': 'USA',
          'latitude': 40.7128,
          'longitude': -74.006,
        },
      };

      print('Birth data request body: ${json.encode(requestBody)}');

      final response = await http.put(
        Uri.parse('$_baseUrl/profiles'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(requestBody),
      );

      print('Birth data response status: ${response.statusCode}');
      print('Birth data response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        if (data['success'] == true && data['data'] != null) {
          return UserProfileResult.fromJson(data['data']);
        } else {
          // Pentru cazul în care API-ul returnează doar success
          return UserProfileResult(
            zodiacSign: 'Capricorn', // Mock pentru demo
            moonSign: 'Pisces',
            ascendantSign: 'Leo',
          );
        }
      } else {
        final errorBody = response.body;
        throw Exception(
          'Failed to submit birth data: ${response.statusCode} - $errorBody',
        );
      }
    } catch (e) {
      print('Error submitting birth data: $e');
      throw Exception('Network error submitting birth data: $e');
    }
  }

  Future<void> updateUserIntents(List<String> intents) async {
    try {
      final accessToken = await _authRepo.getAccessToken();

      if (accessToken == null) {
        throw Exception('No valid session available');
      }

      // Conform API-ului, trebuie să folosim endpoint-ul /profiles cu structura corectă
      final response = await http.put(
        Uri.parse('$_baseUrl/profiles'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode({
          'intents': intents, // Trimitem direct intents
        }),
      );

      // Debug information
      print('Intent update response status: ${response.statusCode}');
      print('Intent update response body: ${response.body}');

      if (response.statusCode != 200) {
        final errorBody = response.body;
        throw Exception(
          'Failed to update user intents: ${response.statusCode} - $errorBody',
        );
      }
    } catch (e) {
      print('Error updating intents: $e');
      throw Exception('Network error updating user intents: $e');
    }
  }
}
