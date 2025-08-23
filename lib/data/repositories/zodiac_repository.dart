import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../core/models/onboarding_models.dart';

abstract class ZodiacRepository {
  Future<List<ZodiacSign>> getZodiacSigns();
  Future<HoroscopeTeaser> getHoroscope(String sign, String tone);
  String calculateZodiacSign(DateTime birthDate);
}

class ZodiacRepositoryImpl implements ZodiacRepository {
  final Dio _dio;

  ZodiacRepositoryImpl(this._dio);

  @override
  Future<List<ZodiacSign>> getZodiacSigns() async {
    try {
      final response = await _dio.get('/api/zodiac/signs');

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<dynamic> signsData = response.data['data'];
        return signsData.map((json) => ZodiacSign.fromJson(json)).toList();
      } else {
        throw Exception('Failed to get zodiac signs');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw Exception('Too many requests. Please try again later.');
      }
      throw Exception('Failed to get zodiac signs: ${e.message}');
    }
  }

  @override
  Future<HoroscopeTeaser> getHoroscope(String sign, String tone) async {
    try {
      final response = await _dio.get(
        '/api/horoscope/$sign',
        queryParameters: {'tone': tone},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        return HoroscopeTeaser.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to get horoscope');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw Exception('Too many requests. Please try again later.');
      }
      throw Exception('Failed to get horoscope: ${e.message}');
    }
  }

  @override
  String calculateZodiacSign(DateTime birthDate) {
    final month = birthDate.month;
    final day = birthDate.day;

    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return 'aries';
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return 'taurus';
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return 'gemini';
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return 'cancer';
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return 'leo';
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return 'virgo';
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return 'libra';
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21))
      return 'scorpio';
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21))
      return 'sagittarius';
    if ((month == 12 && day >= 22) || (month == 1 && day <= 19))
      return 'capricorn';
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18))
      return 'aquarius';
    return 'pisces'; // February 19 - March 20
  }
}

final zodiacRepositoryProvider = Provider<ZodiacRepository>((ref) {
  final dio = ref.read(dioProvider);
  return ZodiacRepositoryImpl(dio);
});
