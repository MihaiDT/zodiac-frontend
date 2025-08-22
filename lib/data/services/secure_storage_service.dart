import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';

class SecureStorageService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      synchronizable: false,
    ),
  );

  static const FlutterSecureStorage _fallbackStorage = FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      synchronizable: false,
      accountName: 'zodiac_numerology_fallback',
    ),
  );

  static Future<String?> read({required String key}) async {
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
        return null;
      }
    }
  }

  static Future<void> write({
    required String key,
    required String value,
  }) async {
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
        throw Exception('Failed to store secure data: $fallbackError');
      }
    }
  }

  static Future<void> delete({required String key}) async {
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
        // Don't throw on delete errors
      }
    }
  }

  static Future<void> deleteAll() async {
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
        // Don't throw on delete errors
      }
    }
  }
}
