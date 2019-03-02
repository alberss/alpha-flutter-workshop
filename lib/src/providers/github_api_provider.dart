import 'dart:convert';

import 'package:alpha_flutter_workshop/src/models/member.dart';
import 'package:http/http.dart' as http;

class GithubApiProvider {
  Future<List<Member>> getMembers() async {
    final response =
        await http.get('https://api.github.com/orgs/valudio/members');
    final List<dynamic> listFromJson = json.decode(response.body);
    final membersList =
        listFromJson.map((parsed) => Member.fromJson(parsed)).toList();
    return membersList;
  }
}
