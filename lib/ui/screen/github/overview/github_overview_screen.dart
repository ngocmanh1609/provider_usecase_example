import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/github_overview_model.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/uimodel/github_overview_uimodel.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/widget/github_overview_list.dart';

class GithubOverviewScreen extends StatelessWidget {
  const GithubOverviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var githubOverviewModel = Provider.of<GithubOverviewModel>(context);
    githubOverviewModel.fetchRepositories();
    print("githubOverviewModel: ${githubOverviewModel.hashCode}");
    return Scaffold(
        appBar: AppBar(
          title: Text("Github Repositories"),
        ),
        body: StreamProvider<List<GithubOverviewUiModel>>.value(
          initialData: [],
          value: githubOverviewModel.githubOverviewUiModels,
          child: GithubOverviewList(),
          catchError: (ctx, obj) {
            return [];
          },
        ));
  }
}
