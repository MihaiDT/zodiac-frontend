import 'package:hooks_riverpod/hooks_riverpod.dart';

class TarotRepository {
  Future<Map<String, dynamic>> drawCard({
    required String userId,
    required String context,
    required String seed,
  }) async {
    try {
      // Mock tarot card data - no API call needed for onboarding
      final cards = [
        {
          'name': 'The Star',
          'shortMeaning':
              'Hope, inspiration, and spiritual guidance await you on your journey.',
          'imageUrl': 'https://example.com/star.jpg',
        },
        {
          'name': 'The Moon',
          'shortMeaning':
              'Trust your intuition and embrace the mysteries that lie ahead.',
          'imageUrl': 'https://example.com/moon.jpg',
        },
        {
          'name': 'The Sun',
          'shortMeaning':
              'Joy, success, and positive energy surround you today.',
          'imageUrl': 'https://example.com/sun.jpg',
        },
      ];

      // Use seed to ensure consistent results for same user/date
      final seedHash = seed.hashCode.abs();
      final cardIndex = seedHash % cards.length;

      return cards[cardIndex];
    } catch (e) {
      throw Exception('Network error drawing card: $e');
    }
  }
}

final tarotRepositoryProvider = Provider<TarotRepository>((ref) {
  return TarotRepository();
});
