import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_dependency_graph/package_selection/services/parser_service.dart';
import 'package:package_dependency_graph/shared/models/dependency.dart';
import 'package:package_dependency_graph/shared/models/dependency_type.dart';
import 'package:package_dependency_graph/shared/models/package.dart';

void main() {
  // this dependency is present in the pubspec file that we parse in the test
  const yamlDep = Dependency(
      name: 'yaml',
      package: 'package_dependency_graph',
      version: '^3.1.1',
      type: DependencyType.regular);

  test('ParserService correctly parses pubspec into a Package object.',
      () async {
    final service = ParserService();

    Package package = service.parsePubspec('test/test-data/package-folder');
    Set<Dependency> deps = package.dependencies;

    expect(deps, isNotEmpty);
    expect(deps, contains(yamlDep));
  });

  test(
      'ParserService throws appropriate exception when input folder has no pubspec.',
      () async {
    final service = ParserService();

    Object? e;
    try {
      service.parsePubspec('test/test-data/non-package-folder');
    } catch (thrown) {
      e = thrown;
    }

    expect(e, isA<AstroInfoException>());
  });
}
