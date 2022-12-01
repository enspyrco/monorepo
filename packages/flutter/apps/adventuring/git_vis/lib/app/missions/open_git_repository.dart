import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';

import '../../git/services/git_service.dart';
import '../state/app_state.dart';

class OpenGitRepository extends AwayMission<AppState> {
  const OpenGitRepository({required String at}) : _projectDirectory = at;

  final String _projectDirectory;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    var service = locate<GitService>();

    service.openRepository(_projectDirectory);
  }

  @override
  toJson() => {
        'name_': 'SetupGit',
        'state_': {'_projectDirectory': _projectDirectory},
      };
}
