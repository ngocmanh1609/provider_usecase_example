import 'package:flutter/material.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/uimodel/github_overview_uimodel.dart';

class GithubOverviewItem extends StatelessWidget {
  final GithubOverviewUiModel _githubOverviewUiModel;

  GithubOverviewItem(this._githubOverviewUiModel);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(_githubOverviewUiModel.ownerAvatar),
      title: Text(_githubOverviewUiModel.repositoryName),
      subtitle: Text(_githubOverviewUiModel.repositoryDescription),
    );
  }
}
