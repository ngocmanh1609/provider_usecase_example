import 'package:injectable/injectable.dart';
import 'package:provider_usecase_example/data/network/repository/github_repository.dart';
import 'package:provider_usecase_example/data/network/response/models/github_repository_response.dart';

@Injectable()
class GetGithubRepositoriesUseCase {
  final GithubRepository _githubRepository;

  GetGithubRepositoriesUseCase(this._githubRepository);

  Future<List<GithubRepositoryResponse>> execute() {
    return _githubRepository.getRepositories();
  }
}
