import 'package:injectable/injectable.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/uimodel/github_overview_uimodel.dart';
import 'package:provider_usecase_example/usecase/get_github_repositories_usecase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

abstract class GithubOverviewModel {
  ValueStream<List<GithubOverviewUiModel>> githubOverviewUiModels;

  void dispose();
}

@Injectable(as: GithubOverviewModel)
class GithubOverviewModelImpl extends GithubOverviewModel {
  GetGithubRepositoriesUseCase _getGithubRepositoriesUseCase;

  GithubOverviewModelImpl(this._getGithubRepositoriesUseCase) {
    _fetchRepositories();
  }

  final _githubOverviewUiModels =
      BehaviorSubject<List<GithubOverviewUiModel>>();

  @override
  ValueStream<List<GithubOverviewUiModel>> get githubOverviewUiModels =>
      _githubOverviewUiModels;

  void _fetchRepositories() {
    _getGithubRepositoriesUseCase.execute().then((responses) {
      List<GithubOverviewUiModel> uiModels = responses.map((response) {
        return GithubOverviewUiModel(
          id: response.id,
          repoPath: response.fullName,
          repositoryName: response.name ?? "",
          repositoryDescription: response.description ?? "",
          ownerName: response.owner.login ?? "",
          ownerAvatar: response.owner.avatarUrl ?? "",
        );
      }).toList();
      _githubOverviewUiModels.add(uiModels);
    }, onError: (e) {
      _githubOverviewUiModels.addError(e);
    });
  }

  @override
  void dispose() {
    this._githubOverviewUiModels.close();
  }
}
