import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usecase_example/di/di.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/github_overview_screen.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/github_overview_model.dart';

class Routes {
  Routes._();

  static const String githubOverview = "/github-overview";
  static const String githubRepositoryDetail = "/github-repository-detail";

  static final routes = <String, WidgetBuilder>{
    githubOverview: (BuildContext context) => Provider(
          create: (ctx) => getIt<GithubOverviewModel>(),
          child: GithubOverviewScreen(),
        ),
  };
}
