import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/models/onboarding_models.dart';
import '../../../core/services/analytics_service.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../data/repositories/zodiac_repository.dart';
import '../../../data/repositories/profile_repository.dart';
import '../../../data/repositories/numerology_repository.dart';

// Onboarding state notifier
class OnboardingNotifier extends StateNotifier<OnboardingState> {
  final AnalyticsService _analytics;
  final AuthRepository _authRepository;
  final ZodiacRepository _zodiacRepository;
  final ProfileRepository _profileRepository;
  final NumerologyRepository _numerologyRepository;

  OnboardingNotifier(
    this._analytics,
    this._authRepository,
    this._zodiacRepository,
    this._profileRepository,
    this._numerologyRepository,
  ) : super(const OnboardingState());

  void startOnboarding() {
    _analytics.logEvent('onboarding_start', {});
    state = state.copyWith(currentStep: 0);
  }

  void setBirthData(BirthData birthData) {
    // Calculate zodiac sign
    final zodiacSign = _zodiacRepository.calculateZodiacSign(
      birthData.birthDate,
    );
    final updatedBirthData = birthData.copyWith(zodiacSign: zodiacSign);

    state = state.copyWith(birthData: updatedBirthData);

    _analytics.logEvent('birth_collected', {
      'hasTime': birthData.birthTime != null,
      'hasPlace': birthData.birthPlace != null,
      'sign': zodiacSign,
    });
  }

  void setPreferences(UserPreferences preferences) {
    state = state.copyWith(preferences: preferences);

    _analytics.logEvent('prefs_collected', {
      'tone': preferences.tone,
      'wantsNotifications': preferences.dailyNotifications,
      'timezone': preferences.timezone,
      'selectedIntents': preferences.selectedIntents,
      'intentsCount': preferences.selectedIntents.length,
    });
  }

  void nextStep() {
    state = state.copyWith(currentStep: state.currentStep + 1);
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }

  Future<void> completeRegistration({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    try {
      setLoading(true);
      setError(null);

      if (state.birthData == null || state.preferences == null) {
        throw Exception('Missing birth data or preferences');
      }

      // Create complete profile data with birth data AND preferences INCLUDING intents
      final profileData = ProfileData(
        birthDate: state.birthData!.birthDate.toIso8601String().split('T')[0],
        birthTime: state.birthData!.birthTime,
        birthPlace: state.birthData!.birthPlace,
        zodiacSign: state.birthData!.zodiacSign,
        tone: state.preferences!.tone,
        notifications: NotificationSettings(
          daily: state.preferences!.dailyNotifications,
          weekly: state.preferences!.weeklyNotifications,
          monthly: state.preferences!.monthlyNotifications,
          tarot: state.preferences!.tarotNotifications,
          numerology: state.preferences!.numerologyNotifications,
        ),
        timezone: state.preferences!.timezone,
        selectedIntents:
            state.preferences!.selectedIntents, // Include selected intents!
      );

      // Register user with complete profile
      final result = await _authRepository.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        profile: profileData,
      );

      _analytics.logEvent('register_success', {'userId': result['user']['id']});

      // No need for separate profile update - everything is in registration

      // Mark onboarding as completed
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboardingDone', true);

      _analytics.logEvent('onboarding_complete', {
        'userId': result['user']['id'],
      });

      setLoading(false);
    } catch (e) {
      setLoading(false);
      setError(e.toString());
    }
  }

  Future<void> handleEmailExists({
    required String email,
    required String password,
  }) async {
    try {
      setLoading(true);
      setError(null);

      final result = await _authRepository.login(
        email: email,
        password: password,
      );

      _analytics.logEvent('login_success', {'userId': result['user']['id']});

      // Update profile with new preferences AND birth data
      if (state.preferences != null && state.birthData != null) {
        final profileUpdateRequest = ProfileUpdateRequest(
          tone: state.preferences!.tone,
          notifications: NotificationSettings(
            daily: state.preferences!.dailyNotifications,
            weekly: state.preferences!.weeklyNotifications,
            monthly: state.preferences!.monthlyNotifications,
            tarot: state.preferences!.tarotNotifications,
            numerology: state.preferences!.numerologyNotifications,
          ),
          timezone: state.preferences!.timezone,
          birthDate: state.birthData!.birthDate.toIso8601String().split('T')[0],
          birthTime: state.birthData!.birthTime,
          birthPlace: state.birthData!.birthPlace,
          zodiacSign: state.birthData!.zodiacSign,
        );

        await _profileRepository.updateProfile(profileUpdateRequest);

        _analytics.logEvent('profile_updated', {
          'tone': state.preferences!.tone,
        });
      }

      // Mark onboarding as completed
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboardingDone', true);

      _analytics.logEvent('onboarding_complete', {
        'userId': result['user']['id'],
      });

      setLoading(false);
    } catch (e) {
      setLoading(false);
      setError(e.toString());
    }
  }
}

// Provider for onboarding state
final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
      return OnboardingNotifier(
        ref.read(analyticsServiceProvider),
        ref.read(authRepositoryProvider),
        ref.read(zodiacRepositoryProvider),
        ref.read(profileRepositoryProvider),
        ref.read(numerologyRepositoryProvider),
      );
    });

// Provider to check if onboarding is completed
final onboardingCompletedProvider = FutureProvider<bool>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('onboardingDone') ?? false;
});

// Provider for horoscope teaser
final horoscopeTeaserProvider = FutureProvider.family<
  HoroscopeTeaser,
  Map<String, String>
>((ref, params) async {
  final zodiacRepository = ref.read(zodiacRepositoryProvider);
  return await zodiacRepository.getHoroscope(params['sign']!, params['tone']!);
});

// Provider for numerology data
final numerologyDataProvider =
    FutureProvider.family<Map<String, dynamic>, DateTime>((
      ref,
      birthDate,
    ) async {
      final numerologyRepository = ref.read(numerologyRepositoryProvider);
      return await numerologyRepository.getLifePathNumber(birthDate);
    });
