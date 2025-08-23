import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class AnalyticsService {
  void logEvent(String name, Map<String, dynamic> params);
}

class MockAnalyticsService implements AnalyticsService {
  @override
  void logEvent(String name, Map<String, dynamic> params) {
    print('📊 Analytics: $name - $params');
  }
}

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  return MockAnalyticsService();
});
