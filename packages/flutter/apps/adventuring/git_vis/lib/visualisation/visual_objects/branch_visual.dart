import 'dart:ui';

import '../../git/models/git_objects/branch.dart';
import '../../interfaces/visual_object.dart';

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
