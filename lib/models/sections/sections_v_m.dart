import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/models/sections/new_section_v_m.dart';
import 'package:the_process/models/sections/section.dart';

part 'sections_v_m.freezed.dart';
part 'sections_v_m.g.dart';

@freezed
class SectionsVM with _$SectionsVM {
  @JsonSerializable(explicitToJson: true)
  factory SectionsVM({
    required NewSectionVM newSection,
    required IList<Section> list,
    required bool creatingNewSection,
  }) = _SectionsVM;

  factory SectionsVM.fromJson(Map<String, dynamic> json) =>
      _$SectionsVMFromJson(json);

  factory SectionsVM.init() => SectionsVM(
      list: <Section>[].lock,
      newSection: NewSectionVM(name: ''),
      creatingNewSection: false);
}
