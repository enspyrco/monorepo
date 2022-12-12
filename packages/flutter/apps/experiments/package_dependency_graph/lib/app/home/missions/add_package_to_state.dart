import 'package:astro_types/core_types.dart';

import '../../../shared/models/package.dart';
import '../../state/app_state.dart';

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
