import 'package:flutter/material.dart';

import 'git/models/git_object_database.dart';
import 'git/services/git_service.dart';
import 'visualisation/visualisation_widget.dart';

void main() async {
  final gitService =
      GitService(repoPath: '/Users/nick/git/orgs/enspyrco/monorepo');

  print(gitService.libgit2Version());

  /// Read in the git object database for the given project.
  final GitObjectDatabase gitObjectDB =
      GitObjectDatabase('/Users/nick/git/orgs/enspyrco/monorepo');

  /// Visualise the object database.
  runApp(MaterialApp(home: VisualisationWidget(gitObjectDB)));
}
