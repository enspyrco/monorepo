import 'dart:io';

import 'package:astro_types/core_types.dart';
import 'package:file_selector/file_selector.dart';
import 'package:package_dependency_graph/app/home/missions/update_dependencies_state.dart';
import 'package:package_dependency_graph/app/state/dependency.dart';
import 'package:package_dependency_graph/app/state/dependency_type.dart';
import 'package:yaml/yaml.dart';

import '../../state/app_state.dart';

class SelectPackages extends AwayMission<AppState> {
  const SelectPackages();

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    const typeGroup = XTypeGroup(
      label: 'yaml',
      extensions: ['yml', 'yaml'],
    );

    final XFile? xFile = await openFile(acceptedTypeGroups: [typeGroup]);
    if (xFile != null) {
      String contents = File(xFile.path).readAsStringSync();

      dynamic yaml = loadYaml(contents);
      YamlMap deps = yaml['dependencies'];
      YamlMap devDeps = yaml['dev_dependencies'];

      final List<Dependency> depsList = [];
      for (final entry in deps.entries) {
        depsList.add(
          Dependency(
              name: entry.key,
              version: entry.value,
              type: DependencyType.regular),
        );
      }

      for (final entry in devDeps.entries) {
        depsList.add(
          Dependency(
            name: entry.key,
            version: entry.value,
            type: DependencyType.dev,
          ),
        );
      }

      missionControl.land(UpdateDependenciesState(dependencies: depsList));
    }
  }

  @override
  toJson() => {'name_': 'SelectPackages', 'state_': <String, dynamic>{}};
}
