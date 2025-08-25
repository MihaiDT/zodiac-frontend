import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/chat_models.dart';
import '../../core/network/dio_provider.dart';
import '../../features/auth/repositories/auth_repository.dart';

class ChatService {
  final Dio _dio;
  final AuthRepository _authRepository;
  
  static const String _baseUrl = 'https://zodiac-api-gmapemgtc7dkasg5.centralus-01.azurewebsites.net/api/chat';
  static const String _messageEndpoint = '$_baseUrl/message';
  
  ChatService(this._dio, this._authRepository);

  Future<ChatMessageResponse> sendMessage(ChatMessageRequest request) async {
    print('🚀 Sending message to BACKEND: ${request.message}');
    print('🎭 Using tone: ${request.tone.name}');
    
    try {
      final token = await _authRepository.getAccessToken();
      if (token == null) {
        throw ChatException('Authentication required');
      }

      print('🔑 Using token: ${token.substring(0, 20)}...');
      print('📡 Making API call to backend...');

      final response = await _dio.post(
        _messageEndpoint,
        data: request.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print('✅ Backend response status: ${response.statusCode}');
      print('✅ Backend response data: ${response.data}');

      final chatResponse = ChatMessageResponse.fromJson(response.data);
      
      print('✅ Chat response received: ${chatResponse.data.response}');
      return chatResponse;
      
    } on DioException catch (e) {
      print('❌ Dio error in sendMessage: ${e.message}');
      if (e.response != null) {
        print('Response status: ${e.response?.statusCode}');
        print('Response data: ${e.response?.data}');
      }
      
      if (e.response?.statusCode == 401) {
        throw ChatException('Authentication required');
      } else if (e.response?.statusCode == 500) {
        throw ChatException('Server error. Try again.');
      } else {
        throw ChatException('Failed to send message');
      }
    } catch (e) {
      print('❌ Unexpected error in sendMessage: $e');
      throw ChatException('Unexpected error: $e');
    }
  }

  Future<ChatHistoryResponse> getHistory({int limit = 50, int offset = 0}) async {
    try {
      final token = await _authRepository.getAccessToken();
      if (token == null) {
        throw ChatException('Authentication required');
      }

      final response = await _dio.get(
        '$_baseUrl/history',
        queryParameters: {'limit': limit, 'offset': offset},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return ChatHistoryResponse.fromJson(response.data);
      
    } catch (e) {
      print('❌ Error in getHistory: $e');
      throw ChatException('Failed to fetch history');
    }
  }

  Future<ChatStatsResponse> getStats() async {
    try {
      final token = await _authRepository.getAccessToken();
      if (token == null) {
        throw ChatException('Authentication required');
      }

      final response = await _dio.get(
        '$_baseUrl/stats',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return ChatStatsResponse.fromJson(response.data);
      
    } catch (e) {
      print('❌ Error in getStats: $e');
      throw ChatException('Failed to fetch stats');
    }
  }

  void clearCache() {
    print('🧹 Cache cleared');
  }
}

class ChatException implements Exception {
  final String message;
  
  const ChatException(this.message);
  
  @override
  String toString() => 'ChatException: $message';
}

final chatServiceProvider = Provider<ChatService>((ref) {
  final dio = ref.watch(dioProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return ChatService(dio, authRepository);
});
