import 'dart:ui';

import '../../git/models/git_objects/branch.dart';
import '../../git/models/git_objects/commit.dart';
import '../../git/models/git_objects/kinship.dart';
import '../../interfaces/visual_object.dart';
import 'area_visual.dart';
import 'branch_visual.dart';
import 'commit_visual.dart';
import 'kinship_visual.dart';

class CommitTreeVisual extends VisualObject {
  CommitTreeVisual({
    required AreaVisual area,
    required Set<Branch> branches,
    required Set<Commit> commits,
    required Set<Kinship> kinships,
  })  : _area = area,
        _branches = branches.map((e) => e.visual).toSet(),
        _commitsMap = {
          for (var commit in commits)
            commit.state.hash: commit.createVisual(area)
        } {
    _kinships = kinships
        .map((e) => e.createVisual(_commitsMap[e.state.child.hash]!,
            _commitsMap[e.state.parent.hash]!))
        .toSet();
  }

  final AreaVisual _area;
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
