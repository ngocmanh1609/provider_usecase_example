import 'package:injectable/injectable.dart';
import 'package:provider_usecase_example/data/network/response/models/github_repository_response.dart';
import 'package:provider_usecase_example/data/network/service/github_service.dart';

abstract class GithubRepository {
  Future<List<GithubRepositoryResponse>> getRepositories();
}

@Singleton(as: GithubRepository)
class GithubRepositoryImpl extends GithubRepository {
  final GithubService _githubService;

  GithubRepositoryImpl(this._githubService);

  @override
  Future<List<GithubRepositoryResponse>> getRepositories() {
    // TODO: implement getRepositories
    throw UnimplementedError();
  }
}
