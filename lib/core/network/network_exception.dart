import 'dart:io';
import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  factory NetworkException.fromDioError(DioException error) {
    // 🌐 No internet / DNS / socket issues
    if (error.error is SocketException) {
      return NetworkException('No internet connection');
    }

    // 🚨 HTTP errors
    if (error.type == DioExceptionType.badResponse) {
      final statusCode = error.response?.statusCode;
      final data = error.response?.data;

      // 🔥 ZenQuotes rate limit (429)
      if (statusCode == 429 && data is List && data.isNotEmpty) {
        final first = data.first;
        if (first is Map && first['a'] == 'zenquotes.io') {
          return NetworkException(
            'You’ve reached the free quote limit. Please try again later.',
          );
        }
      }

      // Generic server error fallback
      return NetworkException('Server error (${statusCode ?? 'unknown'})');
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkException('Connection timeout');
      case DioExceptionType.sendTimeout:
        return NetworkException('Request timeout');
      case DioExceptionType.receiveTimeout:
        return NetworkException('Response timeout');
      case DioExceptionType.cancel:
        return NetworkException('Request cancelled');
      case DioExceptionType.unknown:
      default:
        return NetworkException('Unexpected error occurred');
    }
  }

  @override
  String toString() => message;
}
