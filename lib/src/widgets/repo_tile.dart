import 'package:alpha_flutter_workshop/src/models/repo.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoTile extends StatelessWidget {
  final Repo repo;

  RepoTile(this.repo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(repo.name),
          subtitle: Text(repo.description),
          trailing: RaisedButton(
            child: Text('Open'),
            color: Colors.lime,
            textColor: Colors.green,
            onPressed: _launchURL,
          ),
        ),
        Divider()
      ],
    );
  }

  _launchURL() async {
    if (await canLaunch(repo.htmlUrl)) {
      await launch(repo.htmlUrl);
    } else {
      throw 'Could not launch ${repo.htmlUrl}';
    }
  }
}
