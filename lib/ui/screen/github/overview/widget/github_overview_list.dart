import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/uimodel/github_overview_uimodel.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/widget/github_overview_item.dart';

class GithubOverviewList extends StatelessWidget {
  const GithubOverviewList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uiModels = context.watch<List<GithubOverviewUiModel>>();
    return ListView.builder(
      itemCount: uiModels.length,
      itemBuilder: (ctx, index) {
        return GithubOverviewItem(uiModels[index]);
      },
    );
  }
}
