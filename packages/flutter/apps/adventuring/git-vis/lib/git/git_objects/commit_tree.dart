import 'dart:convert';
import 'dart:io';

import '../../utils/exceptions/file_missing_in_tree_walk.dart';
import '../../visualisation/visual_objects/area_visual.dart';
import '../../visualisation/visual_objects/commit_tree_visual.dart';
import '../object_database.dart';
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
