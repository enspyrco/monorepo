import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';
import '../../shared/models/package.dart';

class AddPackageToState extends LandingMission<AppState> {
  const AddPackageToState(this.package);

  final Package package;

  @override
  AppState landingInstructions(AppState state) {
    return state.copyWith(packages: state.packages..add(package));
  }

  @override
  toJson() => {
        'name_': 'Update Dependencies State',
        'state_': {'dependencies': package},
      };
}
