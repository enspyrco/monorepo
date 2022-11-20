import 'dart:ui';

import '../visualisation/visual_object.dart';

class Branch {
  Branch(String name, String commitHash)
      : _state = BranchState(name, commitHash) {
    _visual = BranchVisual(state);
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

class BranchVisual extends VisualObject {
  BranchVisual(BranchState state) : name = state.name;

  final String name;

  @override
  void paintOnto(Canvas canvas) {
    // TODO: implement drawOnTo
  }

  @override
  void moveForwardInTimeBy(double dt) {
    // TODO: implement update
  }
}
