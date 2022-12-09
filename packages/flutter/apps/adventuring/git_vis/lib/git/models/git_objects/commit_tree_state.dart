import 'package:astro_types/state_types.dart';

import 'branch_state.dart';
import 'commit_state.dart';
import 'kinship_state.dart';

class CommitTreeState implements AstroState {
  const CommitTreeState({
    required this.branches,
    required this.commits,
    required this.kinships,
  });

  final Set<BranchState> branches;
  final Set<CommitState> commits;
  final Set<KinshipState> kinships;

  @override
  AstroState copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
