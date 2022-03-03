import 'package:flutter/material.dart';

import '../../../types.dart';
import '../../redux/extensions/build_context_extensions.dart';
import '../actions/remove_problem_action.dart';

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
