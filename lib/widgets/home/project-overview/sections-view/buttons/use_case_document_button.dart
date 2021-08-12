import 'package:flutter/material.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';

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
