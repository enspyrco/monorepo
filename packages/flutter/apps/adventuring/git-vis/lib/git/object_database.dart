import 'dart:io';

import 'git_objects/branch.dart';

// git-vis-test-repo is a local repo, pre-push (meaning not yet using pack-files)
// const projectDir = '/Users/nick/Desktop/git-vis-test-repo';
const projectDir = '/Users/nick/git/orgs/enspyrco/monorepo';

class ObjectDatabase {
  /// Branches are files in '.git/refs/heads/'.
  /// The branch name is the name of the file.
  /// The commit hash is the trimmed contents of the file.
  static Set<Branch> getBranches() {
    var branches = <Branch>{};
    var entities =
        Directory('$projectDir/.git/refs/heads/').listSync(followLinks: false);

    for (var entity in entities) {
      if (entity is File) {
        branches.add(Branch(
            entity.uri.pathSegments.last, entity.readAsStringSync().trim()));
      }
      if (entity is Directory) {
        // currently we just go one level down to allow for (eg.) nickm/issue1
        for (var subEntity in entity.listSync(followLinks: false)) {
          if (subEntity is File) {
            branches.add(Branch(
                entity.uri.pathSegments.last +
                    '/' +
                    subEntity.uri.pathSegments.last,
                subEntity.readAsStringSync().trim()));
          }
        }
      }
    }

    return branches;
  }
}
