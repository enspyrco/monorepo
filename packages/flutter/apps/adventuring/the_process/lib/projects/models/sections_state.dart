import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'section_model.dart';

class SectionsState implements AstroState {
  const SectionsState({
    required this.newName,
    required this.list,
    required this.creatingNewSection,
  });

  final String newName;
  final List<SectionModel> list;
  final bool creatingNewSection;

  static SectionsState get initial => const SectionsState(
      list: <SectionModel>[], newName: '', creatingNewSection: false);

  @override
  SectionsState copyWith({
    String? newName,
    List<SectionModel>? list,
    bool? creatingNewSection,
  }) =>
      SectionsState(
        newName: newName ?? this.newName,
        list: list ?? this.list,
        creatingNewSection: creatingNewSection ?? this.creatingNewSection,
      );

  @override
  JsonMap toJson() => {
        'newName': newName,
        'list': list.map((e) => e.toJson()).toList(),
        'creatingNewSection': creatingNewSection,
      };
}
