import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/horoscope.dart';
import '../services/horoscope_api_service.dart';

// Selected zodiac sign for horoscope
final horoscopeSelectedSignProvider = StateProvider<String?>((ref) => null);

// Selected tone for horoscope
final horoscopeSelectedToneProvider = StateProvider<HoroscopeTone>(
  (ref) => HoroscopeTone.serious,
);

// Horoscope data provider
final horoscopeProvider = FutureProvider<HoroscopeResponse?>((ref) async {
  final selectedSign = ref.watch(horoscopeSelectedSignProvider);
  final selectedTone = ref.watch(horoscopeSelectedToneProvider);

  if (selectedSign == null) return null;

  final apiService = ref.watch(horoscopeApiServiceProvider);
  return apiService.getHoroscope(sign: selectedSign, tone: selectedTone);
});

// Manual refresh trigger
final horoscopeRefreshProvider = StateProvider<int>((ref) => 0);

// Provider that depends on refresh trigger
final refreshableHoroscopeProvider = FutureProvider<HoroscopeResponse?>((
  ref,
) async {
  // Watch refresh trigger to invalidate cache
  ref.watch(horoscopeRefreshProvider);

  final selectedSign = ref.watch(horoscopeSelectedSignProvider);
  final selectedTone = ref.watch(horoscopeSelectedToneProvider);

  if (selectedSign == null) return null;

  final apiService = ref.watch(horoscopeApiServiceProvider);
  return apiService.getHoroscope(sign: selectedSign, tone: selectedTone);
});
