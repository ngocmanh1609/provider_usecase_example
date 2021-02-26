import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:provider_usecase_example/utils/dio_error_util.dart';

class NetworkException extends Equatable implements Exception {
  final DioError dioError;

  String get message {
    return DioErrorUtil.handleError(dioError);
  }

  int get statusCode {
    return dioError.response.statusCode;
  }

  const NetworkException(this.dioError);

  @override
  List<Object> get props => [dioError];
}
