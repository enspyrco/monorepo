import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:googleapis/firestore/v1.dart';
import 'package:shared_models/src/database_entries/database_entry_mixin.dart';

part 'section_data.freezed.dart';
part 'section_data.g.dart';

@freezed
abstract class SectionData with _$SectionData, DatabaseEntry {
  factory SectionData(
      {required String name,
      String? folderId,
      String? useCasesDocId}) = _SectionData;

  factory SectionData.fromJson(Map<String, dynamic> json) =>
      _$SectionDataFromJson(json);

  @override
  Document toDocument() {
    return Document()
      ..fields = {
        'name': Value()..stringValue = name,
        'folderId': Value()..stringValue = folderId,
        'useCasesDocId': Value()..stringValue = useCasesDocId
      };
  }
}
