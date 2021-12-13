import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:redfire/actions.dart';

import '../../utils/extensions/build_context_extensions.dart';

class TaskDescriptionView extends StatelessWidget {
  const TaskDescriptionView({required this.markdown, Key? key})
      : super(key: key);

  final String markdown;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Markdown(
            data: markdown,
            onTapLink: (_, href, __) =>
                context.dispatch(LaunchUrlAction(url: href ?? '')),
          ),
          Positioned(
              right: 0.0,
              bottom: 0.0,
              child: OutlinedButton(
                  onPressed: () {}, child: const Text('Report Issue')))
        ],
      ),
    );
  }
}
