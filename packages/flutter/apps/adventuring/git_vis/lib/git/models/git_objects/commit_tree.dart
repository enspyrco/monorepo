import '../../../visualisation/visual_objects/area_visual.dart';
import '../../../visualisation/visual_objects/commit_tree_visual.dart';
import 'branch.dart';
import 'commit.dart';
import 'kinship.dart';

/// We walk the commit tree, re-creating the relevant structure and details
/// in-memory as a CommitTree object.
class CommitTree {
  CommitTree({required Set<Branch> branches})
      : _branches = branches,
        _state = CommitTreeState();

  /// Branches are stored as files in '.git/refs/heads/'.
  /// The branch name is the name of the file.
  /// The hash for the latest commit is the trimmed contents of the file.
  final Set<Branch> _branches;

  ///
  final Set<Commit> _commits = {};

  ///
  final Set<Kinship> _kinships = {};

  final CommitTreeState _state;

  CommitTreeVisual createVisual(AreaVisual area) => CommitTreeVisual(
      area: area, branches: _branches, commits: _commits, kinships: _kinships);

  CommitTreeState get state => _state;
  Set<Branch> get branches => _branches;
  Set<Commit> get commits => _commits;

  @override
  String toString() {
    var output = '';
    for (var hash in _state.allCommitsMap.keys) {
      output += hash + ' :\n' + '${_state.allCommitsMap[hash]!}';
    }
    return output;
  }
}

class CommitTreeState {
  CommitTreeState();

  final Map<String, CommitState> allCommitsMap = {};
}
