import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';
import '../../shared/models/package.dart';
import '../services/file_selector_service.dart';
import '../services/parser_service.dart';
import 'add_package_to_state.dart';

class SelectPackages extends AwayMission<AppState> {
  const SelectPackages();

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    final String? path = await locate<FileSelectorService>().openDirectory();

    if (path == null) return; // Not selecting a package is a valid interaction.

    final Package package = locate<ParserService>().parsePubspec(path);

    missionControl.land(AddPackageToState(package));

    print(path);
  }

  @override
  toJson() => {
        'name_': 'Select Packages',
        'state_': <String, dynamic>{},
      };
}
