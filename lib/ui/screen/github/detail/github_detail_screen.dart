import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usecase_example/ui/screen/github/detail/github_detail_model.dart';
import 'package:provider_usecase_example/ui/screen/github/detail/widget/github_detail_body.dart';

class GithubDetailScreen extends StatefulWidget {
  const GithubDetailScreen({Key key}) : super(key: key);

  @override
  _GithubDetailScreenState createState() => _GithubDetailScreenState();
}

class _GithubDetailScreenState extends State<GithubDetailScreen> {
  GithubDetailModel githubDetailModel;
  @override
  Widget build(BuildContext context) {
    final repoName = ModalRoute.of(context).settings.arguments;
    this.githubDetailModel = Provider.of<GithubDetailModel>(context);
    this.githubDetailModel.fetchRepository(repoName);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: StreamProvider.value(
        value: githubDetailModel.githubDetailUiModel,
        child: GithubDetailBody(),
      ),
    );
  }

  @override
  void dispose() {
    this.githubDetailModel?.dispose();
    super.dispose();
  }
}
