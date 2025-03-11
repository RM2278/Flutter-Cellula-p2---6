import 'package:dio/dio.dart';

import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure({required super.statusCode, required super.errMessage});

  factory ServerFailure.fromDioException(DioException exception) {
    String statusCode = exception.response?.statusCode.toString() ?? 'Unknown';
    String errMessage;

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errMessage = 'Connection timed out. Please try again.';
        break;

      case DioExceptionType.badResponse:
        errMessage = exception.response?.data["message"] ??
            _handleServerError(exception.response?.statusCode);
        break;

      case DioExceptionType.cancel:
        errMessage = 'Request was cancelled.';
        break;

      case DioExceptionType.unknown:
      default:
        errMessage = 'An unexpected error occurred.';
    }

    return ServerFailure(statusCode: statusCode, errMessage: errMessage);
  }

  static String _handleServerError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Unauthorized access. Please log in again.';
      case 403:
        return 'Forbidden access.';
      case 404:
        return 'Requested resource not found.';
      case 500:
        return 'Internal server error. Please try later.';
      case 502:
        return 'Bad gateway.';
      case 503:
        return 'Service unavailable. Try again later.';
      default:
        return statusCode != null
            ? 'Unexpected server error. Status code: $statusCode'
            : 'Unexpected server error with unknown status.';
    }
  }
}
