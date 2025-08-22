import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/zodiac_sign.dart';
import '../services/zodiac_api_service.dart';

// State for zodiac signs list
final zodiacSignsProvider = FutureProvider<List<ZodiacSign>>((ref) async {
  final apiService = ref.watch(zodiacApiServiceProvider);
  return apiService.getAllSigns();
});

// State for individual zodiac sign details
final zodiacSignDetailProvider = FutureProvider.family<ZodiacSign, String>((
  ref,
  signId,
) async {
  final apiService = ref.watch(zodiacApiServiceProvider);
  return apiService.getSignDetails(signId);
});

// Selected zodiac sign state
final selectedZodiacSignProvider = StateProvider<String?>((ref) => null);
