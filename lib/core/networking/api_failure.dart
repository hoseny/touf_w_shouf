import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('serverFailure.connectionTimeout'.tr());
      case DioExceptionType.sendTimeout:
        return ServerFailure('serverFailure.sendTimeout'.tr());
      case DioExceptionType.receiveTimeout:
        return ServerFailure('serverFailure.receiveTimeout'.tr());
      case DioExceptionType.badCertificate:
        return ServerFailure('serverFailure.badCertificate'.tr());
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode ?? 500,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('serverFailure.cancel'.tr());
      case DioExceptionType.connectionError:
        return ServerFailure('serverFailure.connectionError'.tr());
      case DioExceptionType.unknown:
        if (_isNetworkError(dioException)) {
          return ServerFailure('serverFailure.noInternet'.tr());
        }
        return ServerFailure('serverFailure.unknownError'.tr());
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic responseData) {
    final message = _parseResponseMessage(responseData);

    switch (statusCode) {
      case 400:
        return ServerFailure(message ?? 'serverFailure.badResponse.400'.tr());
      case 401:
        return ServerFailure(message ?? 'serverFailure.badResponse.401'.tr());
      case 403:
        return ServerFailure(message ?? 'serverFailure.badResponse.403'.tr());
      case 404:
        return ServerFailure(message ?? 'serverFailure.badResponse.404'.tr());
      case 408:
        return ServerFailure('serverFailure.badResponse.408'.tr());
      case 500:
        return ServerFailure('serverFailure.badResponse.500'.tr());
      case 503:
        return ServerFailure('serverFailure.badResponse.503'.tr());
      case 555:
        return ServerFailure('Backend error please try again.');
      default:
        return ServerFailure('serverFailure.badResponse.default'.tr(args: [statusCode.toString()]),
        );
    }
  }

  static String? _parseResponseMessage(dynamic responseData) {
    if (responseData == null) return null;

    // Handle string responses.
    if (responseData is String) {
      return responseData.isNotEmpty ? responseData : null;
    }

    // Handle map responses.
    if (responseData is Map<String, dynamic>) {
      return responseData['message']?.toString() ??
          responseData['error']?.toString() ??
          responseData['detail']?.toString() ??
          responseData['errMessage']?.toString() ??
          responseData['OTP']?.toString() ??
          _parseNestedErrors(responseData);
    }

    // Handle list responses.
    if (responseData is List && responseData.isNotEmpty) {
      return responseData.first.toString();
    }

    return null;
  }

  static String? _parseNestedErrors(Map<String, dynamic> responseData) {
    final errors = responseData['errors'];
    if (errors is Map && errors.isNotEmpty) {
      return errors.values.first?.toString();
    }
    if (errors is List && errors.isNotEmpty) {
      return errors.first.toString();
    }

    final firstValue = responseData.values.first;
    if (firstValue is List && firstValue.isNotEmpty) {
      return firstValue.first.toString();
    }

    return firstValue?.toString();
  }

  static bool _isNetworkError(DioException dioException) {
    return dioException.error is SocketException ||
        (dioException.message?.contains('SocketException') ?? false);
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.errorMessage);

  factory CacheFailure.fromException(Exception exception) {
    return CacheFailure('cacheFailure'.tr(args: [exception.runtimeType.toString()]));
  }
}
