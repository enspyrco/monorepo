import 'dart:ui';

import '../../interfaces/visual_object.dart';
import 'commit.dart';

class Kinship {
  Kinship({required Commit child, required Commit parent})
      : _state = KinshipState(child.state, parent.state),
        _child = child,
        _parent = parent;

  final Commit _child;
  final Commit _parent;

  final KinshipState _state;

  KinshipVisual createVisual(CommitVisual child, CommitVisual parent) =>
      KinshipVisual(child.pos, parent.pos);

  KinshipState get state => _state;
}

class KinshipState {
  KinshipState(this.child, this.parent);

  final CommitState child;
  final CommitState parent;
}

class KinshipVisual extends VisualObject {
  KinshipVisual(Offset start, Offset end)
      : _start = start,
        _end = end;

  final Offset _start;
  final Offset _end;

  @override
  void paintOnto(Canvas canvas) {
    // TODO: implement drawOnTo
  }

  @override
  void moveForwardInTimeBy(double dt) {
    // TODO: implement update
  }
}
