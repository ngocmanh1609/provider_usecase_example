import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usecase_example/ui/screen/github/detail/uimodel/github_detail_uimodel.dart';

class GithubDetailBody extends StatelessWidget {
  const GithubDetailBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uiModel = context.watch<GithubDetailUiModel>();
    if (uiModel == null) {
      return Container();
    } else {
      return Column(
        children: [
          Image.network(uiModel.ownerAvatar),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: Text(uiModel.repoName),
            ),
          ),
        ],
      );
    }
  }
}
