import 'package:flutter/material.dart';

import 'git/object_database.dart';
import 'visualisation/visualisation_widget.dart';

// '/Users/nick/git/orgs/enspyrco/monorepo'

void main() async {
  /// Read in the git object database for the given project.
  final ObjectDatabase gitObjectDB =
      ObjectDatabase('/Users/nick/Desktop/git-vis-test-repo');
  gitObjectDB.readInBranches();
  gitObjectDB.walkCommitTree();

  /// Visualise the object database.
  runApp(MaterialApp(home: VisualisationWidget(gitObjectDB)));
}
