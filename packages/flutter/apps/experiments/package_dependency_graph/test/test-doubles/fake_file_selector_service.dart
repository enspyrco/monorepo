import 'package:package_dependency_graph/package_selection/services/file_selector_service.dart';

class FakeFileSelectorService implements FileSelectorService {
  FakeFileSelectorService({this.path});

  String? path;

  void setPathToPackageFolder() => path = 'test/test-data/package-folder';

  @override
  Future<String?> openDirectory() => Future.value(path ?? 'path');
}
