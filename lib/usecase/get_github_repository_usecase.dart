import 'package:injectable/injectable.dart';
import 'package:provider_usecase_example/data/network/repository/github_repository.dart';
import 'package:provider_usecase_example/data/network/response/models/github_repository_response.dart';

@Injectable()
class GetGithubRepositoryUseCase {
  final GithubRepository _githubRepository;

  GetGithubRepositoryUseCase(this._githubRepository);

  Future<GithubRepositoryResponse> execute(String repositoryPath) {
    return _githubRepository.getRepository(repositoryPath);
  }
}
