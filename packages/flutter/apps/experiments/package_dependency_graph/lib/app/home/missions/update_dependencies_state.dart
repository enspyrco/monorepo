import 'package:astro_types/core_types.dart';

import '../../../shared/models/dependency.dart';
import '../../state/app_state.dart';

class UpdateDependenciesState extends LandingMission<AppState> {
  const UpdateDependenciesState({required this.dependencies});

  final List<Dependency> dependencies;

  @override
  AppState landingInstructions(AppState state) {
    return state.copyWith(dependencies: dependencies);
  }

  @override
  toJson() => {
        'name_': 'UpdateDependenciesState',
        'state_': {'dependencies': dependencies},
      };
}
