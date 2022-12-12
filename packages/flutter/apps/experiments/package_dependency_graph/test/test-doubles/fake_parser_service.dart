import 'package:package_dependency_graph/package_selection/services/parser_service.dart';
import 'package:package_dependency_graph/shared/models/package.dart';

import '../test-data/example-objects/example_packages.dart';

/// [FakeParserService.parsePubspec] will return either the parsedPackage object
/// that was passed in to the fake service or an empty package.
class FakeParserService implements ParserService {
  FakeParserService({this.parsedPackage});

  Package? parsedPackage;

  @override
  Package parsePubspec(String path) => parsedPackage ?? emptyPackage;
}
