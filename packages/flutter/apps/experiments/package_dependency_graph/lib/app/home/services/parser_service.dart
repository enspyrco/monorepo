import 'package:yaml/yaml.dart';

import '../../../shared/models/dependency.dart';
import '../../../shared/models/dependency_type.dart';

class ParserService {
  List<Dependency> parsePubspec(String fileContents) {
    dynamic yaml = loadYaml(fileContents);
    YamlMap deps = yaml['dependencies'];
    YamlMap devDeps = yaml['dev_dependencies'];

    final List<Dependency> depsList = [];
    for (final entry in deps.entries) {
      depsList.add(
        Dependency(
            name: entry.key,
            package: yaml['name'],
            version: '${entry.value}',
            type: DependencyType.regular),
      );
    }

    for (final entry in devDeps.entries) {
      depsList.add(
        Dependency(
          name: entry.key,
          package: yaml['name'],
          version: '${entry.value}',
          type: DependencyType.dev,
        ),
      );
    }

    return depsList;
  }
}
