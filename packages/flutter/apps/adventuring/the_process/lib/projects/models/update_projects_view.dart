import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';

class UpdateProjectsView extends LandingMission<AppState> {
  UpdateProjectsView({bool? creating}) : _creating = creating;

  final bool? _creating;

  @override
  AppState landingInstructions(AppState state) {
    final nextCreating = _creating ?? state.projects.creating;
    final newProjects = state.projects.copyWith(creating: nextCreating);
    return state.copyWith(projects: newProjects);
  }

  @override
  toJson() => {
        'name_': 'UpdateProjectsView',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parent?.hashCode,
        'state_': {'creating': _creating},
      };
}
