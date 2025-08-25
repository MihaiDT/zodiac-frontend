import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repositories/auth_repository.dart';
import '../models/user.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';

part 'auth_controller.freezed.dart';

/// Authentication state
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    @Default(false) bool isLoading,
    @Default(false) bool isAuthenticated,
    String? error,
  }) = _AuthState;
}

/// Authentication controller
class AuthController extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : super(const AuthState()) {
    _initializeAuth();
  }

  /// Initialize authentication state on app startup
  Future<void> _initializeAuth() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final user = await _authRepository.initializeAuth();

      if (user != null) {
        state = state.copyWith(
          user: user,
          isAuthenticated: true,
          isLoading: false,
        );
      } else {
        state = state.copyWith(isAuthenticated: false, isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        isAuthenticated: false,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Login with email and password
  Future<bool> login(
    String email,
    String password, {
    bool rememberMe = false,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final request = LoginRequest(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );

      final response = await _authRepository.login(request);

      state = state.copyWith(
        user: response.user,
        isAuthenticated: true,
        isLoading: false,
      );

      return true;
    } catch (e) {
      String errorMessage = _formatErrorMessage(e.toString());
      state = state.copyWith(isLoading: false, error: errorMessage);
      return false;
    }
  }

  /// Register new user
  Future<bool> register({
    required String email,
    required String password,
    required String name,
    DateTime? birthDate,
    bool agreedToTerms = false,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final request = RegisterRequest(
        email: email,
        password: password,
        name: name,
        birthDate: birthDate,
        agreedToTerms: agreedToTerms,
      );

      final response = await _authRepository.register(request);

      state = state.copyWith(
        user: response.user,
        isAuthenticated: true,
        isLoading: false,
      );

      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      // Always attempt logout (repository handles server failures gracefully)
      await _authRepository.logout();

      // Always clear state regardless of server response
      state = const AuthState();
    } catch (e) {
      // Even if logout fails, always clear local state for security
      print('Logout error (clearing local state anyway): $e');
      state = const AuthState();
    }
  }

  /// Clear error state
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Refresh current user data (optional)
  Future<void> refreshUser() async {
    try {
      final user = await _authRepository.getCurrentUser();
      if (user != null) {
        state = state.copyWith(user: user);
      }
    } catch (e) {
      // Don't update state on error, keep existing user data
    }
  }

  /// Format error message for better user experience
  String _formatErrorMessage(String error) {
    // Check for rate limiting
    if (error.contains('rate_limit_exceeded') || error.contains('429')) {
      return 'Prea multe încercări. Te rog încearcă din nou mai târziu (în ~8 minute).';
    }

    // Check for network errors
    if (error.contains('SocketException') || error.contains('network')) {
      return 'Problemă de conexiune. Verifică internetul și încearcă din nou.';
    }

    // Check for timeout
    if (error.contains('timeout')) {
      return 'Conexiunea a expirat. Te rog încearcă din nou.';
    }

    // Check for invalid credentials
    if (error.contains('invalid_credentials') || error.contains('401')) {
      return 'Email sau parolă incorectă.';
    }

    // Check for user not found
    if (error.contains('user_not_found') || error.contains('404')) {
      return 'Contul nu a fost găsit. Verifică email-ul sau creează un cont nou.';
    }

    // Default error message
    if (error.contains('Exception:')) {
      return error.split('Exception:').last.trim();
    }

    return error.length > 100
        ? 'A apărut o eroare. Te rog încearcă din nou.'
        : error;
  }
}

/// Provider for AuthController
final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return AuthController(authRepository);
  },
);

/// Convenience providers for specific auth state
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authControllerProvider).isAuthenticated;
});

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authControllerProvider).user;
});

final authLoadingProvider = Provider<bool>((ref) {
  return ref.watch(authControllerProvider).isLoading;
});

final authErrorProvider = Provider<String?>((ref) {
  return ref.watch(authControllerProvider).error;
});
