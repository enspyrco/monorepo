import 'package:file_selector/file_selector.dart';
import 'package:package_dependency_graph/app/home/services/file_selector_service.dart';

class FakeFileSelectorService implements FileSelectorService {
  FakeFileSelectorService({this.yamlFile});

  XFile? yamlFile;

  @override
  Future<XFile?> openYaml() {
    return Future.value(yamlFile ?? XFile('test/test-data/pubspec.yaml'));
  }
}
