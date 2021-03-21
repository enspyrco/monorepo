import 'dart:convert';

import 'package:test/test.dart';
import 'package:the_process/actions/sections/store_sections_action.dart';
import 'package:the_process/models/sections/section.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

void main() {
  group('StoreSectionsAction', () {
    test('serializes', () {
      var sectionsJson = [
        {'name': 'name0', 'folderId': 'folderId0', 'useCasesDocId': 'usecase0'},
        {'name': 'name1', 'folderId': 'folderId1', 'useCasesDocId': 'usecase1'},
        {'name': 'name2', 'folderId': 'folderId2', 'useCasesDocId': 'usecase2'},
      ];
      var storeSectionsActionJson = {'list': sectionsJson};
      var storeSectionsAction =
          StoreSectionsAction.fromJson(storeSectionsActionJson);
      var storeSectionsActionToJson = storeSectionsAction.toJson();
      var storeSectionsActionFromJson =
          StoreSectionsAction.fromJson(storeSectionsActionToJson);
      // this make sure when you convert to json and then you build the object again
      // from that json you will get the same object and no data is missing
      expect(storeSectionsAction == storeSectionsActionFromJson, true,
          reason: 'StoreSectionsAction.toJson have a problem');
      // this ensure that json that was given to build the object is the same as the
      // json that was created by the object when using toJson
      expect(
          json.encode(storeSectionsActionJson) ==
              json.encode(storeSectionsActionToJson),
          true,
          reason: 'StoreSectionsAction.fromJson have a problem');
    });
    test(
        'Two StoreSectionsAction one created fromJson and another created with constructor should equal each other if they have same sections on same order ',
        () {
      var sections = <Section>[].lock;
      var sectionsListJson = <Map<String, dynamic>>[];
      for (var i = 0; i < 5; i++) {
        sections = sections.add(Section(
            name: 'name$i',
            folderId: 'folderId$i',
            useCasesDocId: 'usecase$i'));
        sectionsListJson.add(<String, dynamic>{
          'name': 'name$i',
          'folderId': 'folderId$i',
          'useCasesDocId': 'usecase$i'
        });
      }
      var storeSectionsAction = StoreSectionsAction(list: sections);
      var storeSectionsActionFromJson = StoreSectionsAction.fromJson(
          <String, dynamic>{'list': sectionsListJson});
      expect(storeSectionsAction == storeSectionsActionFromJson, true);
    });
  });
}
