import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';
import '../models/git_objects/commit_tree_state.dart';
import '../services/git_service.dart';

class OpenGitRepository extends AwayMission<AppState> {
  const OpenGitRepository({required String at}) : _projectDirectory = at;

  final String _projectDirectory;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    final GitService service = locate<GitService>();

    service.openRepository(_projectDirectory);

    final CommitTreeState tree = service.getCommitTree();
  }

  @override
  toJson() => {
        'name_': 'SetupGit',
        'state_': {'_projectDirectory': _projectDirectory},
      };
}
