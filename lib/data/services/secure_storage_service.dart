import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class SecureStorageService {
  // Check if we should use secure storage or fallback to SharedPreferences
  static bool get _shouldUseSecureStorage => !(kDebugMode && Platform.isIOS);

  // For iOS Simulator, use more permissive settings
  static IOSOptions get _iosOptions {
    if (kDebugMode && Platform.isIOS) {
      // iOS Simulator settings - more permissive
      return const IOSOptions(
        accessibility: KeychainAccessibility.unlocked_this_device,
        synchronizable: false,
        groupId: 'com.zodiacnumerology.zodiacNumerology',
        accountName: 'zodiac_numerology_main',
      );
    }
    // Production iOS device settings
    return const IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      synchronizable: false,
      groupId: 'com.zodiacnumerology.zodiacNumerology',
    );
  }

  static FlutterSecureStorage get _storage => FlutterSecureStorage(
    aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    iOptions: _iosOptions,
  );

  static const FlutterSecureStorage _fallbackStorage = FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.unlocked_this_device,
      synchronizable: false,
      accountName: 'zodiac_numerology_fallback',
      groupId: 'com.zodiacnumerology.zodiacNumerology',
    ),
  );

  /// Final fallback using SharedPreferences for production reliability
  /// Note: Less secure but ensures app functionality
  static Future<SharedPreferences> _getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  static Future<String?> read({required String key}) async {
    // In debug mode on iOS, skip SecureStorage entirely to avoid simulator keychain issues
    if (!_shouldUseSecureStorage) {
      try {
        final prefs = await _getSharedPrefs();
        return prefs.getString('secure_$key');
      } catch (e) {
        if (kDebugMode) {
          print('SharedPreferences read failed: $e');
        }
        return null;
      }
    }

    try {
      return await _storage.read(key: key);
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorage read error: $e, trying fallback...');
      }
      try {
        return await _fallbackStorage.read(key: key);
      } catch (fallbackError) {
        if (kDebugMode) {
          print('Fallback storage also failed: $fallbackError');
        }
        // Final fallback to SharedPreferences
        try {
          final prefs = await _getSharedPrefs();
          return prefs.getString('secure_$key');
        } catch (prefsError) {
          if (kDebugMode) {
            print('SharedPreferences fallback also failed: $prefsError');
          }
          return null;
        }
      }
    }
  }

  static Future<void> write({
    required String key,
    required String value,
  }) async {
    // In debug mode on iOS, use SharedPreferences directly to avoid simulator keychain issues
    if (!_shouldUseSecureStorage) {
      try {
        final prefs = await _getSharedPrefs();
        await prefs.setString('secure_$key', value);
        return;
      } catch (e) {
        if (kDebugMode) {
          print('SharedPreferences write failed: $e');
        }
        // Continue to try secure storage if SharedPreferences fails
      }
    }

    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorage write error: $e, trying fallback...');
      }
      try {
        await _fallbackStorage.write(key: key, value: value);
      } catch (fallbackError) {
        if (kDebugMode) {
          print('Fallback storage write also failed: $fallbackError');
        }
        // Final fallback to SharedPreferences - MUST NOT FAIL
        try {
          final prefs = await _getSharedPrefs();
          await prefs.setString('secure_$key', value);
          if (kDebugMode) {
            print('Successfully stored using SharedPreferences fallback');
          }
        } catch (prefsError) {
          if (kDebugMode) {
            print('SharedPreferences fallback failed: $prefsError');
          }
          // For production: log error but don't throw to avoid breaking authentication
          // In a real app, you'd want to log this to your analytics/crash reporting
          print('CRITICAL: All storage methods failed for key: $key');
        }
      }
    }
  }

  static Future<void> delete({required String key}) async {
    // In debug mode on iOS, clean up SharedPreferences directly
    if (!_shouldUseSecureStorage) {
      try {
        final prefs = await _getSharedPrefs();
        await prefs.remove('secure_$key');
        return;
      } catch (e) {
        if (kDebugMode) {
          print('SharedPreferences delete failed: $e');
        }
        // Continue to try secure storage if SharedPreferences fails
      }
    }

    try {
      await _storage.delete(key: key);
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorage delete error: $e, trying fallback...');
      }
      try {
        await _fallbackStorage.delete(key: key);
      } catch (fallbackError) {
        if (kDebugMode) {
          print('Fallback storage delete also failed: $fallbackError');
        }
        // Final fallback to SharedPreferences
        try {
          final prefs = await _getSharedPrefs();
          await prefs.remove('secure_$key');
        } catch (prefsError) {
          if (kDebugMode) {
            print('SharedPreferences delete fallback failed: $prefsError');
          }
          // Don't throw on delete errors
        }
      }
    }
  }

  static Future<void> deleteAll() async {
    // In debug mode on iOS, clean up SharedPreferences directly
    if (!_shouldUseSecureStorage) {
      try {
        final prefs = await _getSharedPrefs();
        final keys = prefs.getKeys().where((key) => key.startsWith('secure_'));
        for (final key in keys) {
          await prefs.remove(key);
        }
        return;
      } catch (e) {
        if (kDebugMode) {
          print('SharedPreferences deleteAll failed: $e');
        }
        // Continue to try secure storage if SharedPreferences fails
      }
    }

    try {
      await _storage.deleteAll();
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorage deleteAll error: $e, trying fallback...');
      }
      try {
        await _fallbackStorage.deleteAll();
      } catch (fallbackError) {
        if (kDebugMode) {
          print('Fallback storage deleteAll also failed: $fallbackError');
        }
        // Final fallback to SharedPreferences
        try {
          final prefs = await _getSharedPrefs();
          final keys = prefs.getKeys().where(
            (key) => key.startsWith('secure_'),
          );
          for (final key in keys) {
            await prefs.remove(key);
          }
        } catch (prefsError) {
          if (kDebugMode) {
            print('SharedPreferences deleteAll fallback failed: $prefsError');
          }
          // Don't throw on delete errors
        }
      }
    }
  }
}
