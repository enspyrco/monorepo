import 'dart:convert';
import 'dart:io';

import '../utils/exceptions/file_missing_in_tree_walk.dart';
import 'git_objects/branch.dart';
import 'git_objects/commit.dart';
import 'git_objects/commit_tree.dart';

/// Git's repository system is also called the object database. It acts as a
/// storage area for Git's internal objects (the term database is not
/// technically accurate but the name is commonly used and provides a helpful
/// mental model).
class ObjectDatabase {
  ObjectDatabase(this.projectDir) {
    var branches = readInBranches();
    _commitTree = CommitTree(branches: branches);
  }

  final String projectDir;

  late final CommitTree _commitTree;

  CommitTree get commitTree => _commitTree;

  /// A branch is made up of a ref (the branch name) and a head (the commit
  /// id of the tip of the branch).
  ///
  /// A repository’s heads are located in .git/refs/heads/.
  ///   - one file for each branch
  ///   - the content in each file is the commit ID of the most recent commit on the branch.
  Set<Branch> readInBranches() {
    final Set<Branch> branches = {};

    final entities =
        Directory('$projectDir/.git/refs/heads/').listSync(followLinks: false);

    /// Loop through files in heads folder and create branches
    for (var entity in entities) {
      if (entity is File) {
        branches.add(
          Branch(
            name: entity.uri.pathSegments.last,
            commitHash: entity.readAsStringSync().trim(),
          ),
        );
      } else if (entity is Directory) {
        // go one level down to allow for (eg.) nickm/issue1
        for (var subEntity in entity.listSync(followLinks: false)) {
          if (subEntity is File) {
            branches.add(
              Branch(
                name: entity.uri.pathSegments.last +
                    '/' +
                    subEntity.uri.pathSegments.last,
                commitHash: subEntity.readAsStringSync().trim(),
              ),
            );
          }
        }
      }
    }

    return branches;
  }

  void walkCommitTree() {
    // Walk the tree to build the data structure
    var branchTips = {
      for (var branch in _commitTree.branches) branch.state.commitHash
    };
    _walk(branchTips);
  }

  // Recursively walk the commit tree, creating a map of commitHash : CommitObject
  void _walk(Set<String> commitHashes) {
    if (commitHashes.isEmpty) return;

    for (var hash in commitHashes) {
      if (_commitTree.state.allCommitsMap[hash] == null) {
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
        _commitTree.commits.add(commit);
        _commitTree.state.allCommitsMap[hash] = commit.state;

        // keep on walkin
        _walk(commit.state.parents);
      }
    }
  }
}
