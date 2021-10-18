import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'section_model.freezed.dart';
part 'section_model.g.dart';

@freezed
class SectionModel with _$SectionModel {
  factory SectionModel({
    required String name,
    required String folderId,
    required String useCasesDocId,
  }) = _SectionModel;

  factory SectionModel.fromJson(JsonMap json) => _$SectionModelFromJson(json);
}
