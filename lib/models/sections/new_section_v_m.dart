import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_section_v_m.freezed.dart';
part 'new_section_v_m.g.dart';

@freezed
class NewSectionVM with _$NewSectionVM {
  factory NewSectionVM({required String name}) = _NewSectionVM;

  factory NewSectionVM.fromJson(Map<String, dynamic> json) =>
      _$NewSectionVMFromJson(json);
}
