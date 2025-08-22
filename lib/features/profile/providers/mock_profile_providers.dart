import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/profile.dart';

// Mock profile provider for development/testing
final mockUserProfileProvider = FutureProvider<UserProfile>((ref) async {
  // Simulate network delay
  await Future.delayed(const Duration(seconds: 1));

  // Return a mock profile for testing
  return UserProfile(
    id: 'mock-user-123',
    email: 'test@example.com',
    name: 'Test User',
    firstName: 'Test',
    lastName: 'User',
    birthdate: '1990-01-15',
    zodiacSign: 'capricorn',
    avatar: null,
    settings: const ProfileSettings(
      notifications: NotificationSettings(
        dailyHoroscope: true,
        weeklyForecast: true,
        monthlyInsights: false,
        numerologyUpdates: true,
        specialEvents: true,
      ),
      horoscopeTone: 'serious',
      analyticsEnabled: true,
      language: 'en',
      timezone: 'UTC',
    ),
    createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
    updatedAt: DateTime.parse('2024-08-21T19:00:00Z'),
  );
});
