
import 'package:dio/dio.dart';

import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleDioExceptions(DioException e) {
    ErrorModel defaultError = ErrorModel(
    status: 0,
    errorMessage: "An unknown error occurred.",
  );
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //bad request
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
        case 401: //unathorized
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
        case 403: //forbidden
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
        case 404: //not found
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
        case 409: //cofficient
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
        case 422: //unprocessable entity
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));
        case 504: // server exception
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response?.data ?? defaultError.toJson()));

              default:
            // Handle other unexpected status codes
            throw ServerException(
              errorModel: ErrorModel(
                status: 0,
                errorMessage: "Unexpected error  ",
              ),
            );
      }
  }
}
