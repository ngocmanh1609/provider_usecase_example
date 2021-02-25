import 'package:provider_usecase_example/data/network/base/api_result.dart';
import 'package:provider_usecase_example/data/network/base/dio_client.dart';
import 'package:provider_usecase_example/data/network/base/endpoints.dart';
import 'package:provider_usecase_example/data/network/exception/network_exceptions.dart';
import 'package:provider_usecase_example/data/network/response/models/github_repository_response.dart';

abstract class GithubService {
  Future<ApiResult<List<GithubRepositoryResponse>>> getRepositories();
}

class GithubServiceImpl extends GithubService {
  final DioClient _dioClient;

  GithubServiceImpl(this._dioClient);

  @override
  Future<ApiResult<List<GithubRepositoryResponse>>> getRepositories() async {
    try {
      final response = await _dioClient.get(Endpoints.getRepositories);
      List<GithubRepositoryResponse> responseData = (response.data as List)
          .map((repository) => GithubRepositoryResponse.fromJson(repository));
      return ApiResult.success(responseData);
    } catch (e) {
      return ApiResult.failure(NetworkException(e));
    }
  }
}
