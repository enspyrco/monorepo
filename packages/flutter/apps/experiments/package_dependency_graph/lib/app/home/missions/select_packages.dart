import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:file_selector/file_selector.dart';
import 'package:package_dependency_graph/app/home/missions/update_dependencies_state.dart';

import '../../state/app_state.dart';
import '../../state/dependency.dart';
import '../services/file_selector_service.dart';
import '../services/parser_service.dart';

class SelectPackages extends AwayMission<AppState> {
  const SelectPackages();

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    final XFile? xFile = await locate<FileSelectorService>().openYaml();

    if (xFile == null) return; // Not selecting a file is a valid interaction.

    final String fileContents = await xFile.readAsString();

    final List<Dependency> depsList =
        locate<ParserService>().parsePubspec(fileContents);

    missionControl.land(UpdateDependenciesState(dependencies: depsList));
  }

  @override
  toJson() => {'name_': 'SelectPackages', 'state_': <String, dynamic>{}};
}
