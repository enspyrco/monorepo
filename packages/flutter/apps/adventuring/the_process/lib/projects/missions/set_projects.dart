import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';
import '../models/project_state.dart';

class SetProjects extends LandingMission<AppState> {
  SetProjects({required Set<ProjectState> projects}) : _projects = projects;

  final Set<ProjectState> _projects;

  @override
  AppState landingInstructions(AppState state) {
    var newProjects = state.projects.copyWith(all: _projects);
    return state.copyWith(projects: newProjects);
  }

  @override
  toJson() => {
        'name_': 'SetProjects',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parent?.hashCode,
        'state_': {
          'projects': [for (var project in _projects) project.toJson()]
        },
      };
}
