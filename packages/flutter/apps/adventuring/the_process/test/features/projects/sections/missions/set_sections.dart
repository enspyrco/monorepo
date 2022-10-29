import 'dart:convert';

import 'package:astro_types/json_types.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/projects/models/section_model.dart';
import 'package:the_process/sections/missions/set_sections.dart';

import '../../../../test-doubles/data/example_data.dart';

void main() {
  group('StoreSectionsAction', () {
    test('serializes to & from json correctly', () {
      // store some example json data
      var jsonMap = storeProjectSectionsActionJson;

      // create the action from given json data
      var action = SetSections.fromJson(jsonMap);

      var newJsonMap = action.toJson();

      // check that the action object has the same json as the original test data
      expect(jsonEncode(jsonMap), jsonEncode(newJsonMap));

      // check the json data produced by toJson deserializes back to an equivalent object
      expect(SetSections.fromJson(newJsonMap), action);
    });

    test(
        'Two StoreSectionsAction one created fromJson and another created with constructor should equal each other if they have same sections on same order ',
        () {
      var sections = <SectionModel>[];
      var sectionsListJson = <JsonMap>[];
      for (var i = 0; i < 5; i++) {
        sections.add(SectionModel(
            name: 'name$i',
            folderId: 'folderId$i',
            useCasesDocId: 'usecase$i'));
        sectionsListJson.add(<String, dynamic>{
          'name': 'name$i',
          'folderId': 'folderId$i',
          'useCasesDocId': 'usecase$i'
        });
      }
      var storeProjectSectionsAction = SetSections(list: sections);
      var storeProjectSectionsActionFromJson =
          SetSections.fromJson(<String, dynamic>{'list': sectionsListJson});
      expect(storeProjectSectionsAction == storeProjectSectionsActionFromJson,
          true);
    });
  });
}
