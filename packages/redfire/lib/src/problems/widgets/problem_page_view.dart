import 'package:flutter/material.dart';
import 'package:redfire/src/problems/actions/remove_problem_action.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/types.dart';

class ProblemPageView<T extends RedFireState> extends StatelessWidget {
  const ProblemPageView(this.info, {Key? key}) : super(key: key);

  final ProblemInfo info;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Whoops'),
      content: SingleChildScrollView(child: Text(info.message)),
      actions: [
        OutlinedButton(
            onPressed: () => context.dispatch<T>(RemoveProblemAction(info)),
            child: const Text('Dismiss'))
      ],
    );
  }
}
