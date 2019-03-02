import 'package:alpha_flutter_workshop/src/models/member.dart';
import 'package:alpha_flutter_workshop/src/providers/github_api_provider.dart';
import 'package:flutter/material.dart';

class MembersListScreen extends StatelessWidget {
  final GithubApiProvider githubApiProvider;

  MembersListScreen(this.githubApiProvider);

  @override
  Widget build(BuildContext context) {
    final List<Member> members = githubApiProvider.getMembers();

    return Scaffold(
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return Text(members[index].login);
        },
      ),
    );
  }
}
