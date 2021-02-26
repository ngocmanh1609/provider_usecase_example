import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usecase_example/di/di.dart';
import 'package:provider_usecase_example/ui/screen/github/detail/github_detail_model.dart';
import 'package:provider_usecase_example/ui/screen/github/detail/github_detail_screen.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/github_overview_screen.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/github_overview_model.dart';
import 'package:provider_usecase_example/ui/screen/home/home_screen.dart';

class Routes {
  Routes._();

  static const String firstScreen = "/";
  static const String githubOverview = "/github-overview";
  static const String githubRepositoryDetail = "/github-repository-detail";

  static final routes = <String, WidgetBuilder>{
    firstScreen: (BuildContext context) => HomeScreen(),
    githubOverview: (BuildContext context) => Provider(
          create: (ctx) => getIt<GithubOverviewModel>(),
          child: GithubOverviewScreen(),
        ),
    githubRepositoryDetail: (BuildContext context) => Provider(
        create: (ctx) => getIt<GithubDetailModel>(),
        child: GithubDetailScreen()),
  };
}
