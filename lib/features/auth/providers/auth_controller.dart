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
      state = state.copyWith(isLoading: false, error: e.toString());
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

      await _authRepository.logout();

      state = const AuthState();
    } catch (e) {
      // Even if logout fails on server, clear local state
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// Clear error state
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Refresh user data
  Future<void> refreshUser() async {
    if (!state.isAuthenticated) return;

    try {
      final user = await _authRepository.initializeAuth();
      if (user != null) {
        state = state.copyWith(user: user);
      }
    } catch (e) {
      // Don't update state on error, keep existing user data
    }
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
