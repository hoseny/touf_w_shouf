import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:touf_w_shouf/core/networking/api_endpoints.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';

/// A singleton factory class for configuring and managing a Dio instance.
class DioFactory {
  // Private constructor to prevent direct instantiation
  DioFactory._();

  // Default timeout duration for API requests
  static const _defaultTimeout = Duration(seconds: 30);

  // Private static Dio instance
  static Dio? _dioInstance;

  /// Getter to retrieve the Dio instance
  /// Throws an exception if initialize() is not called before accessing it
  static Dio get dio {
    if (_dioInstance == null) {
      throw Exception('Dio instance not initialized. Call initialize() first.');
    }
    return _dioInstance!;
  }

  /// Initializes the Dio instance if it's not already created
  static Future<void> initialize() async {
    if (_dioInstance != null) return;

    _dioInstance = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl, // Base API URL
        connectTimeout: _defaultTimeout,
        receiveTimeout: _defaultTimeout,
        sendTimeout: _defaultTimeout,
      ),
    );

    _addAuthInterceptor(); // Add authentication token interceptor
    _addLoggingInterceptor(); // Add logging interceptor (only in debug mode)
  }

  /// Adds an interceptor to attach the authentication token to each request
  static void _addAuthInterceptor() {
    _dioInstance?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = SharedPref.getString(key: SharedPrefKeys.token);
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options); // Continue the request
        },
      ),
    );
  }

  /// Adds a logging interceptor for debugging API requests and responses
  static void _addLoggingInterceptor() {
    if (kDebugMode) {
      _dioInstance?.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
        ),
      );
    }
  }

  /// Updates the authentication token and refreshes the interceptor
  static Future<void> updateAuthToken(String newToken) async {
    await SharedPref.setData(
      key: SharedPrefKeys.token,
      value: newToken,
    );

    // Remove existing authentication interceptors
    _dioInstance?.interceptors.removeWhere(
          (interceptor) => interceptor is InterceptorsWrapper,
    );

    _addAuthInterceptor(); // Re-add updated authentication interceptor
  }

  /// Clears the stored authentication token and removes it from requests
  static Future<void> clearAuthToken() async {
    await SharedPref.removeData(key: SharedPrefKeys.token);

    // Remove authentication interceptors
    _dioInstance?.interceptors.removeWhere(
          (interceptor) => interceptor is InterceptorsWrapper,
    );

    _addAuthInterceptor(); // Re-add interceptor (without token)
  }
}