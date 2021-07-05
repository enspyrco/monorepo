import 'package:flutter/material.dart';
import 'package:redfire/src/problems/actions/remove_problem_action.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';

import '../../../types.dart';

/// Creates a widget to show an error from a type of [Problem].
/// The [ProblemInfoPage] is used for alerting a user to an error.
class ProblemInfoPage<T extends RedFireState> extends StatelessWidget {
  final ProblemInfo info;

  const ProblemInfoPage(this.info);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Whoops'),
      content: SingleChildScrollView(child: Text(info.message)),
      actions: [
        OutlinedButton(
            onPressed: () => context.dispatch(RemoveProblemAction(info)),
            child: Text('Dismiss'))
      ],
    );
  }
}
