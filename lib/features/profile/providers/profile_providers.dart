import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/profile.dart';
import '../services/profile_api_service.dart';

// User profile provider with manual retry control
final userProfileProvider = StateNotifierProvider<UserProfileNotifier, AsyncValue<UserProfile>>((ref) {
  return UserProfileNotifier(ref);
});

// User profile notifier with retry control
class UserProfileNotifier extends StateNotifier<AsyncValue<UserProfile>> {
  final Ref _ref;
  int _errorCount = 0;
  static const int _maxRetries = 3;

  UserProfileNotifier(this._ref) : super(const AsyncValue.loading()) {
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final apiService = _ref.read(profileApiServiceProvider);
      final profile = await apiService.getProfile();
      state = AsyncValue.data(profile);
      _errorCount = 0; // Reset error count on success
    } catch (error, stackTrace) {
      _errorCount++;
      
      // Don't retry on server errors or after max retries
      if (_shouldStopRetrying(error)) {
        state = AsyncValue.error(error, stackTrace);
      } else {
        // Wait before retrying
        await Future.delayed(Duration(seconds: _errorCount * 2));
        if (mounted) {
          _loadProfile();
        }
      }
    }
  }

  bool _shouldStopRetrying(dynamic error) {
    final errorString = error.toString();
    
    // Stop retrying on these conditions:
    // 1. Too many retries
    if (_errorCount >= _maxRetries) return true;
    
    // 2. Server errors (500) - these won't fix themselves
    if (errorString.contains('500') || errorString.contains('internal_error')) return true;
    
    // 3. Rate limiting (429) - need to wait longer
    if (errorString.contains('429') || errorString.contains('rate_limit_exceeded')) return true;
    
    // 4. Authentication errors (should redirect to login)
    if (errorString.contains('401') || errorString.contains('unauthorized')) return true;
    
    return false;
  }

  Future<void> retry() async {
    _errorCount = 0;
    state = const AsyncValue.loading();
    await _loadProfile();
  }

  void reset() {
    _errorCount = 0;
    state = const AsyncValue.loading();
    _loadProfile();
  }
}

// Profile update state
final profileUpdateProvider =
    StateNotifierProvider<ProfileUpdateNotifier, AsyncValue<UserProfile?>>(
      (ref) => ProfileUpdateNotifier(ref),
    );

// Profile update notifier
class ProfileUpdateNotifier extends StateNotifier<AsyncValue<UserProfile?>> {
  final Ref _ref;

  ProfileUpdateNotifier(this._ref) : super(const AsyncValue.data(null));

  Future<void> updateProfile(ProfileUpdateRequest request) async {
    state = const AsyncValue.loading();

    try {
      final apiService = _ref.read(profileApiServiceProvider);
      final updatedProfile = await apiService.updateProfile(request);

      // Invalidate the main profile provider to refresh data
      _ref.invalidate(userProfileProvider);

      state = AsyncValue.data(updatedProfile);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}
