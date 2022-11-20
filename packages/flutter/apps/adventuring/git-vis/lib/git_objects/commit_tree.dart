import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import '../git/object_database.dart';
import '../visualisation/area_visual.dart';
import '../visualisation/visual_object.dart';
import 'branch.dart';
import 'commit.dart';
import 'kinship.dart';

class CommitTree {
  CommitTree.walkAndParse({required Set<Branch> branches})
      : _branches = branches,
        _commits = {},
        _kinships = {},
        _state = CommitTreeState() {
    // Walk the tree to build the data structure
    var commitHashes = branches.map<String>((e) => e.state.commitHash).toSet();
    walk(commitHashes);
  }

  final Set<Branch> _branches;
  final Set<Commit> _commits;
  final Set<Kinship> _kinships;

  final CommitTreeState _state;

  CommitTreeVisual createVisual(AreaVisual area) => CommitTreeVisual(
      area: area, branches: _branches, commits: _commits, kinships: _kinships);

  CommitTreeState get state => _state;

  // Recursively walk the commit tree, creating a map of commitHash : CommitObject
  void walk(Set<String> commitHashes) {
    if (commitHashes.isEmpty) return;

    for (var hash in commitHashes) {
      if (_state.allCommitsMap[hash] == null) {
        // use the commitHash to locate and open the file
        var folderName = hash.substring(0, 2);
        var fileName = hash.substring(2).trimRight();
        var fileNameString = '$projectDir/.git/objects/$folderName/$fileName';
        var file = File(fileNameString);

        if (!file.existsSync()) {
          throw FileMissingInTreetWalk(fileNameString);
        }

        // read, decompress & decode the contents of the file
        var commitObjectBytes = file.readAsBytesSync();
        var inflatedCommitObject = zlib.decode(commitObjectBytes);
        var commitObjectString = utf8.decode(inflatedCommitObject);

        // parse and store the commit object
        var commit = Commit.from(hash, commitObjectString);
        _commits.add(commit);
        _state.allCommitsMap[hash] = commit.state;

        // keep on walkin
        walk(commit.state.parents);
      }
    }
  }

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

class FileMissingInTreetWalk implements Exception {
  FileMissingInTreetWalk(this.message);
  final String message;

  @override
  String toString() =>
      'While out on a tree walk there was a missing node: $message';
}
