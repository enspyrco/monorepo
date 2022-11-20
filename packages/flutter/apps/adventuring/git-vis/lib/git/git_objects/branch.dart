import 'dart:io';

import '../../visualisation/visual_objects/branch_visual.dart';

class Branch {
  Branch({required String name, required String commitHash})
      : _state = BranchState(name, commitHash) {
    _visual = BranchVisual(state);
  }

  Branch.from(File file)
      : _state = BranchState(
            file.uri.pathSegments.last, file.readAsStringSync().trim()) {
    String name = file.uri.pathSegments.last;
    String commitHash = file.readAsStringSync().trim();
  }

  final BranchState _state;
  late final BranchVisual _visual;

  BranchState get state => _state;
  BranchVisual get visual => _visual;

  @override
  String toString() {
    return 'Branch, state: $_state';
  }
}

class BranchState {
  BranchState(this.name, this.commitHash);

  final String name;
  final String commitHash;

  @override
  String toString() => 'name: $name, commitHash: $commitHash';
}
