import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:package_dependency_graph/app/home/services/parser_service.dart';
import 'package:package_dependency_graph/app/state/dependency.dart';
import 'package:package_dependency_graph/app/state/dependency_type.dart';

void main() {
  // this dependency is present in the pubspec file that we parse in the test
  const yamlDep = Dependency(
      name: 'yaml',
      package: 'package_dependency_graph',
      version: '^3.1.1',
      type: DependencyType.regular);

  test(
      'ParserService correctly parses pubsepc files into a list of Dependency objects.',
      () async {
    final service = ParserService();

    File file = File('test/test-data/pubspec.yaml');
    String fileContents = file.readAsStringSync();

    List<Dependency> depsList = service.parsePubspec(fileContents);

    expect(depsList, isNotEmpty);
    expect(depsList, contains(yamlDep));
  });
}
