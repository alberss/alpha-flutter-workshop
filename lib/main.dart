import 'package:alpha_flutter_workshop/src/providers/github_api_provider.dart';
import 'package:alpha_flutter_workshop/src/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  final githubProvider = GithubApiProvider();
  runApp(MyApp(githubProvider));
}

class MyApp extends StatelessWidget {
  final githubProvider;

  MyApp(this.githubProvider);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpha Github Organization members',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MembersListScreen(githubProvider),
      onGenerateRoute: _routes,
    );
  }

  Route _routes(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => settings.name == '/'
            ? MembersListScreen(githubProvider)
            : MemberReposScreen(githubProvider, memberName: settings.name));
  }
}
