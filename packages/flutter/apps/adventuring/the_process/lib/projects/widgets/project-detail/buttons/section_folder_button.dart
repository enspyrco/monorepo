import 'package:flutter/material.dart';
import 'package:redfire/actions.dart';

import '../../../../utils/build_context_extensions.dart';

class SectionFolderButton extends StatelessWidget {
  final String? folderId;
  const SectionFolderButton(this.folderId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (folderId == null) return
    final folderUrl = 'https://drive.google.com/drive/folders/$folderId';
    return IconButton(
      icon: const Icon(Icons.folder_open_outlined),
      onPressed: () => context.dispatch(LaunchUrlAction(url: folderUrl)),
    );
  }
}
