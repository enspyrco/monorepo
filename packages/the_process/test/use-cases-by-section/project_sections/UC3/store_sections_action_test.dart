import 'dart:convert';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/types.dart';
import 'package:test/test.dart';
import 'package:the_process/projects/models/section_model.dart';
import 'package:the_process/sections/actions/set_sections_action.dart';

import '../../../test-doubles/data/example_data.dart' as example_data;

void main() {
  group('StoreSectionsAction', () {
    test('serializes to & from json correctly', () {
      // store some example json data
      var jsonMap = example_data.storeProjectSectionsActionJson;

      // create the action from given json data
      var action = SetSectionsAction.fromJson(jsonMap);

      var newJsonMap = action.toJson();

      // check that the action object has the same json as the original test data
      expect(jsonEncode(jsonMap), jsonEncode(newJsonMap));

      // check the json data produced by toJson deserializes back to an equivalent object
      expect(SetSectionsAction.fromJson(newJsonMap), action);
    });
    test(
        'Two StoreSectionsAction one created fromJson and another created with constructor should equal each other if they have same sections on same order ',
        () {
      var sections = <SectionModel>[].lock;
      var sectionsListJson = <JsonMap>[];
      for (var i = 0; i < 5; i++) {
        sections = sections.add(SectionModel(
            name: 'name$i',
            folderId: 'folderId$i',
            useCasesDocId: 'usecase$i'));
        sectionsListJson.add(<String, dynamic>{
          'name': 'name$i',
          'folderId': 'folderId$i',
          'useCasesDocId': 'usecase$i'
        });
      }
      var storeProjectSectionsAction = SetSectionsAction(list: sections);
      var storeProjectSectionsActionFromJson = SetSectionsAction.fromJson(
          <String, dynamic>{'list': sectionsListJson});
      expect(storeProjectSectionsAction == storeProjectSectionsActionFromJson,
          true);
    });
  });
}
