import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../services/auth_service.dart';

/// Provider for auth service with modern Riverpod integration
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

/// Extension to add modern methods needed by chat service
extension AuthServiceExtension on AuthService {
  /// Get valid token (refresh if needed)
  Future<String?> getValidToken() async {
    if (isAuthenticated) {
      return accessToken;
    }
    
    // Try to refresh token if available
    try {
      // This would typically refresh the token
      // For now, return existing token
      return accessToken;
    } catch (e) {
      return null;
    }
  }
}
