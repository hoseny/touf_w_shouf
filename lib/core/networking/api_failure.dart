import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            'Connection timed out. Please check your internet and try again.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            'Request timed out. Check your connection and try again.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            'Server response timed out. Check your connection or try again later.');
      case DioExceptionType.badCertificate:
        return ServerFailure('Oops There was an Error, Please try again');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('The request was canceled. Please try again.');
      case DioExceptionType.connectionError:
        return ServerFailure(
            'Unable to connect. Please check your internet connection and try again.');
      case DioExceptionType.unknown:
        if (dioException.message != null &&
            dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    // Check if the first value is a list, and handle accordingly
    final firstKeyValue = response[response.keys.first];

    if (statusCode == 404) {
      return ServerFailure(
        firstKeyValue is List && firstKeyValue.isNotEmpty
            ? firstKeyValue[0]['Error']
                .toString() // If it's a list, extract the first error message
            : firstKeyValue ?? 'Your request was not found, please try later',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
          'There is a problem with the server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        firstKeyValue is List && firstKeyValue.isNotEmpty
            ? firstKeyValue[0].toString() // Handle if it's a list
            : firstKeyValue ?? 'Unexpected Error, Please try again',
      );
    } else if (statusCode == 555) {
      return ServerFailure('Backend Error, Please try again');
    } else {
      return ServerFailure('There was an error, please try again');
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.message);

  factory CacheFailure.fromResponse(String message) => CacheFailure(message);
}