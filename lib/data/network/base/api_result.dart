import 'package:provider_usecase_example/data/network/exception/network_exceptions.dart';

class ApiResult<T> {
  Result result;
  T data;
  NetworkException error;

  ApiResult.success(this.data) : result = Result.Success;

  ApiResult.failure(this.error) : result = Result.Failure;
}

enum Result { Success, Failure }
