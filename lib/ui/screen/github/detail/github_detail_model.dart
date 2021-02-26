import 'package:injectable/injectable.dart';
import 'package:provider_usecase_example/ui/screen/github/detail/uimodel/github_detail_uimodel.dart';
import 'package:provider_usecase_example/usecase/get_github_repository_usecase.dart';
import 'package:rxdart/rxdart.dart';

abstract class GithubDetailModel {
  ValueStream<GithubDetailUiModel> githubDetailUiModel;

  void fetchRepository(String repositoryPath);

  void dispose();
}

@Injectable(as: GithubDetailModel)
class GithubDetailModelImpl extends GithubDetailModel {
  GetGithubRepositoryUseCase _getGithubRepositoryUseCase;

  GithubDetailModelImpl(this._getGithubRepositoryUseCase);

  final _githubDetailUiModel = BehaviorSubject<GithubDetailUiModel>();

  @override
  ValueStream<GithubDetailUiModel> get githubDetailUiModel =>
      _githubDetailUiModel;

  @override
  void fetchRepository(String repositoryPath) {
    _getGithubRepositoryUseCase.execute(repositoryPath).then((response) {
      var uiModel = GithubDetailUiModel(
          response.fullName ?? "", response.owner.avatarUrl ?? "");
      _githubDetailUiModel.add(uiModel);
    });
  }

  @override
  void dispose() {
    _githubDetailUiModel.close();
  }
}
