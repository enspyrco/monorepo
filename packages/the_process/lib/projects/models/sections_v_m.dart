import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'section_model.dart';

part 'sections_v_m.freezed.dart';
part 'sections_v_m.g.dart';

@freezed
class SectionsVM with _$SectionsVM {
  const SectionsVM._();
  const factory SectionsVM({
    required String newName,
    required IList<SectionModel> list,
    required bool creatingNewSection,
  }) = _SectionsVM;

  factory SectionsVM.fromJson(JsonMap json) => _$SectionsVMFromJson(json);

  factory SectionsVM.init() => SectionsVM(
      list: <SectionModel>[].lock, newName: '', creatingNewSection: false);
}
