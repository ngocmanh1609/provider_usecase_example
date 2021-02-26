import 'package:injectable/injectable.dart';
import 'package:provider_usecase_example/data/network/base/api_result.dart';
import 'package:provider_usecase_example/data/network/response/models/github_repository_response.dart';
import 'package:provider_usecase_example/data/network/service/github_service.dart';

abstract class GithubRepository {
  Future<List<GithubRepositoryResponse>> getRepositories();

  Future<GithubRepositoryResponse> getRepository(String repositoryPath);
}

@Singleton(as: GithubRepository)
class GithubRepositoryImpl extends GithubRepository {
  final GithubService _githubService;

  GithubRepositoryImpl(this._githubService);

  @override
  Future<List<GithubRepositoryResponse>> getRepositories() {
    return _githubService.getRepositories().then((apiResult) {
      if (apiResult.result == Result.Success) {
        return Future.value(apiResult.data);
      } else {
        return Future.error(apiResult.error);
      }
    });
  }

  @override
  Future<GithubRepositoryResponse> getRepository(String repositoryPath) {
    return _githubService.getRepository(repositoryPath).then((apiResult) {
      if (apiResult.result == Result.Success) {
        return Future.value(apiResult.data);
      } else {
        return Future.error(apiResult.error);
      }
    });
  }
}
