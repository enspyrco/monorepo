import 'dart:io';

import 'package:yaml/yaml.dart';

import '../../../shared/models/dependency.dart';
import '../../../shared/models/dependency_type.dart';
import '../../../shared/models/package.dart';

class ParserService {
  Package parsePubspec(String path) {
    final String fileContents = File('$path/pubspec.yaml').readAsStringSync();
    dynamic yaml = loadYaml(fileContents);
    YamlMap yamlDeps = yaml['dependencies'];
    YamlMap yamlDevDeps = yaml['dev_dependencies'];

    final packageName = yaml['name'];

    final Set<Dependency> deps = {};
    for (final entry in yamlDeps.entries) {
      deps.add(
        Dependency(
            name: entry.key,
            package: packageName,
            version: '${entry.value}',
            type: DependencyType.regular),
      );
    }

    final Set<Dependency> devDeps = {};
    for (final entry in yamlDevDeps.entries) {
      devDeps.add(
        Dependency(
          name: entry.key,
          package: packageName,
          version: '${entry.value}',
          type: DependencyType.dev,
        ),
      );
    }

    return Package(
      dependencies: deps,
      devDependencies: devDeps,
      location: path,
      name: packageName,
    );
  }
}
