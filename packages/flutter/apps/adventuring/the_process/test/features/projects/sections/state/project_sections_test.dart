import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/projects/models/section_model.dart';

void main() {
  group('ProjectSectionModel', () {
    test('serializes to & from json correctly', () {
      var json = {
        'name': 'name0',
        'folderId': 'folderId0',
        'useCasesDocId': 'usecase0'
      };

      var section = SectionModel.fromJson(json);

      expect(section.toJson(), json);
    });
  }, skip: true); // While we sort our Sections and how they will work
}
