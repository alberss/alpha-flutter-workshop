import 'package:alpha_flutter_workshop/src/models/member.dart';
import 'package:alpha_flutter_workshop/src/providers/github_api_provider.dart';
import 'package:alpha_flutter_workshop/src/widgets/member_tile.dart';
import 'package:flutter/material.dart';

class MembersListScreen extends StatelessWidget {
  final GithubApiProvider githubProvider;

  MembersListScreen(this.githubProvider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: githubProvider.getMembers(),
        builder: (context, AsyncSnapshot<List<Member>> snapshot) {
          return snapshot.hasData
              ? _buildList(snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget _buildList(List<Member> members) {
    return Scaffold(
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return MemberTile(members[index]);
        },
      ),
    );
  }
}
