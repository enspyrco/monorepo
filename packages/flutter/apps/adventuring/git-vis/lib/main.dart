import 'dart:ffi';

import 'package:flutter/material.dart';

import 'git/git_object_database.dart';
import 'visualisation/visualisation_widget.dart';

// '/Users/nick/git/orgs/enspyrco/monorepo'

void main() async {
  DynamicLibrary lib = DynamicLibrary.open('libgit2.1.5.0.dylib');
  // DynamicLibrary lib = DynamicLibrary.executable();
  print(lib.providesSymbol('git_libgit2_init'));

  // final int Function(int x, int y) nativeAdd = nativeAddLib
  //   .lookup<NativeFunction<Int32 Function(Int32, Int32)>>('native_add')
  //   .asFunction();

  /// Read in the git object database for the given project.
  final GitObjectDatabase gitObjectDB =
      GitObjectDatabase('/Users/nick/git/orgs/enspyrco/monorepo');
  // gitObjectDB.readInBranches();
  // gitObjectDB.walkCommitTree();

  // final repo = Repository.open('/Users/nick/git/orgs/enspyrco/monorepo');
  // final branches = repo.branches;
  // print(branches);

  /// Visualise the object database.
  runApp(MaterialApp(home: VisualisationWidget(gitObjectDB)));
}
