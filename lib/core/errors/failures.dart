import 'dart:io';

import 'package:dio/dio.dart';

class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDio(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            'The connection to the server could not be established');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!);
      case DioExceptionType.cancel:
        return ServerFailure('Request Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error,please try again!');
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return ServerFailure(
              'No Internet Connection, please check your internet and try again');
        } else {
          return ServerFailure('Opps There Was An Error, please try again!');
        }

      default:
        return ServerFailure('Opps There Was An Error, please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode) {
    if (statusCode == 400) {
      return ServerFailure('Invalid Request');
    } else if (statusCode == 401) {
      return ServerFailure('Unauthorized Request');
    } else if (statusCode == 403) {
      return ServerFailure('Site Disabled');
    } else if (statusCode == 404) {
      return ServerFailure('Request Not Found,please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error,please try later!');
    } else {
      return ServerFailure('Opps There Was An Error, please try again!');
    }
  }
}
