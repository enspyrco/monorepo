import 'package:test/test.dart';
import 'package:the_process/models/project_sections/project_section.dart';

void main() {
  group('ProjectSectionModel', () {
    test('serializes to & from json correctly', () {
      var json = {
        'name': 'name0',
        'folderId': 'folderId0',
        'useCasesDocId': 'usecase0'
      };

      var projectSection = ProjectSection.fromJson(json);

      expect(projectSection.toJson(), json);
    });
  });
}
