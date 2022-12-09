import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';
import '../services/git_service.dart';

class OpenGitRepository extends AwayMission<AppState> {
  const OpenGitRepository({required String at}) : _projectDirectory = at;

  final String _projectDirectory;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    final GitService service = locate<GitService>();

    service.openRepository(_projectDirectory);
  }

  @override
  toJson() => {
        'name_': 'Open Git Repository',
        'state_': {'_projectDirectory': _projectDirectory},
      };
}
