import 'dart:ui';

import '../../git/models/git_objects/commit_tree_state.dart';
import '../../interfaces/visual_object.dart';
import 'area_visual.dart';
import 'branch_visual.dart';
import 'commit_visual.dart';
import 'kinship_visual.dart';

class CommitTreeVisual extends VisualObject {
  CommitTreeVisual({
    required AreaVisual within,
    required CommitTreeState state,
  })  : _area = within,
        _state = state,
        _branches = {...state.branches.map(BranchVisual.new)},
        _commitsMap = {};

  final AreaVisual _area;
  final CommitTreeState _state;
  final Set<BranchVisual> _branches;
  final Map<String, CommitVisual> _commitsMap;
  late final Set<KinshipVisual> _kinships;

  @override
  void paintOnto(Canvas canvas) {
    for (var commit in _commitsMap.values) {
      commit.paintOnto(canvas);
    }
  }

  /// [dt] is seconds since last update
  @override
  void moveForwardInTimeBy(double dt) {
    for (var commit in _commitsMap.values) {
      commit.moveForwardInTimeBy(dt);
    }
  }
}
