import 'package:astro_types/state_types.dart';
import 'package:git_vis/git/models/git_objects/commit_tree_state.dart';

class ObjectDatabaseState implements AstroState {
  const ObjectDatabaseState({required this.commitTree});

  final CommitTreeState commitTree;

  static ObjectDatabaseState get initial {
    return const ObjectDatabaseState(
        commitTree: CommitTreeState(branches: {}, commits: {}, kinships: {}));
  }

  @override
  AstroState copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  toJson() => {};
}
