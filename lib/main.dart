import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_usecase_example/di/di.dart';
import 'package:provider_usecase_example/routes.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/github_overview_model.dart';
import 'package:provider_usecase_example/ui/screen/github/overview/github_overview_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  return runZonedGuarded(() async {
    runApp(MyApp());
  }, (error, stack) {
    print("error: $error\nstack: $stack");
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      home: Provider(
        create: (context) => getIt<GithubOverviewModel>(),
        child: GithubOverviewScreen(),
      ),
    );
  }
}
