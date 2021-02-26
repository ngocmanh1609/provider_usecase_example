import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/github_overview_model.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/uimodel/github_overview_uimodel.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/widget/github_overview_list.dart';

class GithubOverviewScreen extends StatefulWidget {
  const GithubOverviewScreen({Key key}) : super(key: key);

  @override
  _GithubOverviewScreenState createState() => _GithubOverviewScreenState();
}

class _GithubOverviewScreenState extends State<GithubOverviewScreen> {
  GithubOverviewModel githubOverviewModel;

  @override
  Widget build(BuildContext context) {
    this.githubOverviewModel = Provider.of<GithubOverviewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Github Repositories"),
        ),
        body: StreamProvider<List<GithubOverviewUiModel>>.value(
          initialData: null,
          value: githubOverviewModel.githubOverviewUiModels,
          child: GithubOverviewList(),
          catchError: (ctx, obj) {
            return [];
          },
        ));
  }

  @override
  void dispose() {
    this.githubOverviewModel?.dispose();
    super.dispose();
  }
}
