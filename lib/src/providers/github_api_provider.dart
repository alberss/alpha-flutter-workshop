import 'dart:convert';

import 'package:alpha_flutter_workshop/src/data/members.dart';
import 'package:alpha_flutter_workshop/src/models/member.dart';

class GithubApiProvider {
  List<Member> getMembers() {
    final List<dynamic> listFromJson = json.decode(members);
    final membersList =
        listFromJson.map((parsed) => Member.fromJson(parsed)).toList();
    return membersList;
  }
}
