import 'package:flutter/material.dart';
import 'package:the_process/actions/problems/remove_problem.dart';
import 'package:the_process/extensions/flutter_extensions.dart';
import 'package:the_process/models/problems/problem.dart';

/// Creates a widget to show an error from a type of [Problem].
/// The ProblemPage is used for alerting a user to an error.
class ProblemPage extends StatelessWidget {
  final Problem problem;

  const ProblemPage(this.problem);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Whoops'),
      content: SingleChildScrollView(
        child: Text(problem.errorString),
      ),
      actions: [
        OutlinedButton(
            onPressed: () => context.dispatch(RemoveProblem(problem: problem)),
            child: Text('Dismiss'))
      ],
    );
  }
}
