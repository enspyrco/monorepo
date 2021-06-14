import 'package:flutter/material.dart';
import 'package:redfire/actions/remove_problem_action.dart';
import 'package:redfire/problems/models/problem_info.dart';
import 'package:redfire/redux/extensions/build_context_extensions.dart';

/// Creates a widget to show an error from a type of [Problem].
/// The [ProblemInfoPage] is used for alerting a user to an error.
class ProblemInfoPage extends StatelessWidget {
  final ProblemInfo info;

  const ProblemInfoPage(this.info);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Whoops'),
      content: SingleChildScrollView(
        child: Text(info.message),
      ),
      actions: [
        OutlinedButton(
            onPressed: () => context.dispatch(RemoveProblemAction(info: info)),
            child: Text('Dismiss'))
      ],
    );
  }
}
