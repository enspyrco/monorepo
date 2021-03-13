import 'package:flireator/actions/git_hub/launch_git_hub_auth.dart';
import 'package:flireator/extensions/flutter/build_context_extensions.dart';
import 'package:flutter/material.dart';

class GitHubActivateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text('ACTIVATE GITHUB'),
        onPressed: () {
          context.dispatch(LaunchGitHubAuth());
        });
  }
}
