import 'dart:convert';

import 'package:alpha_flutter_workshop/src/models/member.dart';
import 'package:alpha_flutter_workshop/src/models/repo.dart';
import 'package:http/http.dart' as http;

class GithubApiProvider {
  Future<List<Member>> getMembers() async {
    final response =
        await http.get('https://api.github.com/orgs/BcnRust/members');
    final List<dynamic> listFromJson = json.decode(response.body);
    final membersList =
        listFromJson.map((parsed) => Member.fromJson(parsed)).toList();
    return membersList;
  }

  Future<List<Repo>> getMemberRepos(String memberName) async {
    final response =
        await http.get('https://api.github.com/users/$memberName/repos');
    final List<dynamic> listFromJson = json.decode(response.body);
    final reposList =
        listFromJson.map((parsed) => Repo.fromJson(parsed)).toList();
    return reposList;
  }
}
