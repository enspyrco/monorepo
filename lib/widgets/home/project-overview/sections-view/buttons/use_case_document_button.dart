import 'package:flutter/material.dart';
import 'package:the_process/actions/platform/launch_url_action.dart';
import 'package:the_process/extensions/flutter_extensions.dart';

class UseCaseDocumentButton extends StatelessWidget {
  final String? documentId;
  const UseCaseDocumentButton(this.documentId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (folderId == null) return
    final documentURL = 'https://docs.google.com/document/d/$documentId/edit';
    return IconButton(
      icon: const Icon(Icons.text_snippet),
      onPressed: () => context.dispatch(LaunchUrlAction(url: documentURL)),
    );
  }
}

class LaunchUrlAAction {}
