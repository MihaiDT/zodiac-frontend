import 'package:flutter_test/flutter_test.dart';
import 'package:zodiac_numerology/features/auth/models/login_request.dart';
import 'package:zodiac_numerology/features/auth/models/register_request.dart';
import 'package:zodiac_numerology/features/auth/models/user.dart';
import 'package:zodiac_numerology/features/auth/models/auth_response.dart';

void main() {
  group('Auth Model Tests', () {
    group('LoginRequest Tests', () {
      test('should create LoginRequest with valid data', () {
        final loginRequest = LoginRequest(
          email: 'test@example.com',
          password: 'password123',
          rememberMe: true,
        );

        expect(loginRequest.email, equals('test@example.com'));
        expect(loginRequest.password, equals('password123'));
        expect(loginRequest.rememberMe, equals(true));
      });

      test('should serialize LoginRequest to JSON correctly', () {
        final loginRequest = LoginRequest(
          email: 'test@example.com',
          password: 'password123',
          rememberMe: false,
        );

        final json = loginRequest.toJson();

        expect(json['email'], equals('test@example.com'));
        expect(json['password'], equals('password123'));
        expect(json['rememberMe'], equals(false));
      });

      test('should create LoginRequest from JSON correctly', () {
        final json = {
          'email': 'test@example.com',
          'password': 'password123',
          'rememberMe': true,
        };

        final loginRequest = LoginRequest.fromJson(json);

        expect(loginRequest.email, equals('test@example.com'));
        expect(loginRequest.password, equals('password123'));
        expect(loginRequest.rememberMe, equals(true));
      });
    });

    group('RegisterRequest Tests', () {
      test('should create RegisterRequest with valid data', () {
        final birthDate = DateTime(1990, 1, 1);
        final registerRequest = RegisterRequest(
          email: 'newuser@example.com',
          password: 'SecurePass123!',
          name: 'New User',
          birthDate: birthDate,
          agreedToTerms: true,
        );

        expect(registerRequest.email, equals('newuser@example.com'));
        expect(registerRequest.password, equals('SecurePass123!'));
        expect(registerRequest.name, equals('New User'));
        expect(registerRequest.birthDate, equals(birthDate));
        expect(registerRequest.agreedToTerms, equals(true));
      });

      test('should serialize RegisterRequest to JSON correctly', () {
        final birthDate = DateTime(1990, 1, 1);
        final registerRequest = RegisterRequest(
          email: 'newuser@example.com',
          password: 'SecurePass123!',
          name: 'New User',
          birthDate: birthDate,
          agreedToTerms: true,
        );

        final json = registerRequest.toJson();

        expect(json['email'], equals('newuser@example.com'));
        expect(json['password'], equals('SecurePass123!'));
        expect(json['name'], equals('New User'));
        expect(json['birthDate'], equals(birthDate.toIso8601String()));
        expect(json['agreedToTerms'], equals(true));
      });
    });

    group('User Tests', () {
      test('should create User with required fields', () {
        final createdAt = DateTime.now();
        final user = User(
          id: '123',
          email: 'user@example.com',
          name: 'Test User',
          createdAt: createdAt,
        );

        expect(user.id, equals('123'));
        expect(user.email, equals('user@example.com'));
        expect(user.name, equals('Test User'));
        expect(user.createdAt, equals(createdAt));
        expect(user.birthDate, isNull);
      });

      test('should create User with optional birth date', () {
        final createdAt = DateTime.now();
        final birthDate = DateTime(1990, 5, 15);
        final user = User(
          id: '123',
          email: 'user@example.com',
          name: 'Test User',
          birthDate: birthDate,
          createdAt: createdAt,
        );

        expect(user.birthDate, equals(birthDate));
      });

      test('should serialize User to JSON correctly', () {
        final createdAt = DateTime.now();
        final birthDate = DateTime(1990, 5, 15);
        final user = User(
          id: '123',
          email: 'user@example.com',
          name: 'Test User',
          birthDate: birthDate,
          createdAt: createdAt,
        );

        final json = user.toJson();

        expect(json['id'], equals('123'));
        expect(json['email'], equals('user@example.com'));
        expect(json['name'], equals('Test User'));
        expect(json['birthDate'], equals(birthDate.toIso8601String()));
        expect(json['createdAt'], equals(createdAt.toIso8601String()));
      });

      test('should create JSON string representation', () {
        final createdAt = DateTime.now();
        final user = User(
          id: '123',
          email: 'user@example.com',
          name: 'Test User',
          createdAt: createdAt,
        );

        final jsonString = user.toJsonString();

        expect(jsonString, isA<String>());
        expect(jsonString.contains('"id":"123"'), isTrue);
        expect(jsonString.contains('"email":"user@example.com"'), isTrue);
      });

      test('should create User from JSON string', () {
        final createdAt = DateTime.now();
        final originalUser = User(
          id: '123',
          email: 'user@example.com',
          name: 'Test User',
          createdAt: createdAt,
        );

        final jsonString = originalUser.toJsonString();
        final parsedUser = UserExtensions.fromJsonString(jsonString);

        expect(parsedUser.id, equals(originalUser.id));
        expect(parsedUser.email, equals(originalUser.email));
        expect(parsedUser.name, equals(originalUser.name));
        expect(parsedUser.createdAt, equals(originalUser.createdAt));
      });
    });

    group('AuthResponse Tests', () {
      test('should create AuthResponse with all fields', () {
        final user = User(
          id: '123',
          email: 'user@example.com',
          name: 'Test User',
          createdAt: DateTime.now(),
        );

        final authResponse = AuthResponse(
          user: user,
          accessToken: 'access_token_123',
          refreshToken: 'refresh_token_123',
          expiresIn: 3600,
        );

        expect(authResponse.user, equals(user));
        expect(authResponse.accessToken, equals('access_token_123'));
        expect(authResponse.refreshToken, equals('refresh_token_123'));
        expect(authResponse.expiresIn, equals(3600));
      });

      test('should serialize AuthResponse to JSON correctly', () {
        final user = User(
          id: '123',
          email: 'user@example.com',
          name: 'Test User',
          createdAt: DateTime.now(),
        );

        final authResponse = AuthResponse(
          user: user,
          accessToken: 'access_token_123',
          refreshToken: 'refresh_token_123',
          expiresIn: 3600,
        );

        final json = authResponse.toJson();

        expect(json['user'], isA<User>());
        expect(json['user'].id, equals('123'));
        expect(json['user'].email, equals('user@example.com'));
        expect(json['accessToken'], equals('access_token_123'));
        expect(json['refreshToken'], equals('refresh_token_123'));
        expect(json['expiresIn'], equals(3600));
      });

      test('should create AuthResponse from JSON correctly', () {
        final userJson = {
          'id': '123',
          'email': 'user@example.com',
          'name': 'Test User',
          'createdAt': DateTime.now().toIso8601String(),
        };

        final json = {
          'user': userJson,
          'accessToken': 'access_token_123',
          'refreshToken': 'refresh_token_123',
          'expiresIn': 3600,
        };

        final authResponse = AuthResponse.fromJson(json);

        expect(authResponse.user.id, equals('123'));
        expect(authResponse.user.email, equals('user@example.com'));
        expect(authResponse.accessToken, equals('access_token_123'));
        expect(authResponse.refreshToken, equals('refresh_token_123'));
        expect(authResponse.expiresIn, equals(3600));
      });
    });
  });

  group('Password Validation Tests', () {
    test('should validate strong password correctly', () {
      const password = 'SecurePass123!';

      // Test password strength requirements
      expect(
        password.length >= 8,
        isTrue,
        reason: 'Password should be at least 8 characters',
      );
      expect(
        password.contains(RegExp(r'[A-Z]')),
        isTrue,
        reason: 'Password should contain uppercase letter',
      );
      expect(
        password.contains(RegExp(r'[a-z]')),
        isTrue,
        reason: 'Password should contain lowercase letter',
      );
      expect(
        password.contains(RegExp(r'[0-9]')),
        isTrue,
        reason: 'Password should contain number',
      );
      expect(
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
        isTrue,
        reason: 'Password should contain special character',
      );
    });

    test('should identify weak password correctly', () {
      const weakPassword = 'password';

      expect(weakPassword.length >= 8, isTrue);
      expect(
        weakPassword.contains(RegExp(r'[A-Z]')),
        isFalse,
        reason: 'Weak password missing uppercase',
      );
      expect(
        weakPassword.contains(RegExp(r'[0-9]')),
        isFalse,
        reason: 'Weak password missing number',
      );
      expect(
        weakPassword.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
        isFalse,
        reason: 'Weak password missing special character',
      );
    });
  });

  group('Email Validation Tests', () {
    test('should validate correct email format', () {
      const validEmails = [
        'test@example.com',
        'user.name@domain.co.uk',
        'user+tag@example.org',
        'firstname.lastname@company.com',
      ];

      for (final email in validEmails) {
        expect(
          RegExp(
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
          ).hasMatch(email),
          isTrue,
          reason: 'Email $email should be valid',
        );
      }
    });

    test('should identify invalid email format', () {
      const invalidEmails = [
        'invalid-email',
        '@example.com',
        'user@',
        'user@.com',
        'user.example.com',
        'user@com',
      ];

      for (final email in invalidEmails) {
        expect(
          RegExp(
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
          ).hasMatch(email),
          isFalse,
          reason: 'Email $email should be invalid',
        );
      }
    });
  });
}
