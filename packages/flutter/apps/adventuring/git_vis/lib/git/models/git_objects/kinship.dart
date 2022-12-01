import '../../../visualisation/visual_objects/commit_visual.dart';
import '../../../visualisation/visual_objects/kinship_visual.dart';
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
