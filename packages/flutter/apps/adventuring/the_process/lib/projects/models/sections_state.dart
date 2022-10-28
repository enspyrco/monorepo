import 'package:astro_types/state_types.dart';

import 'section_model.dart';

class SectionsState with AstroState {
  SectionsState({
    required this.newName,
    required this.list,
    required this.creatingNewSection,
  });

  final String newName;
  final List<SectionModel> list;
  final bool creatingNewSection;

  static SectionsState get initial => SectionsState(
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
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
