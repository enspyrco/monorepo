import 'package:astro_types/core_types.dart';
import 'package:astro_types/json_types.dart';

import '../../app/state/app_state.dart';
import '../../projects/models/section_model.dart';

class SetSections extends LandingMission<AppState> {
  const SetSections({required List<SectionModel> list}) : _list = list;

  final List<SectionModel> _list;

  @override
  AppState landingInstructions(AppState state) {
    var newSections = state.sections.copyWith(list: _list);
    return state.copyWith(sections: newSections);
  }

  factory SetSections.fromJson(Map<String, dynamic> json) => SetSections(
      list: (json['list'] as List<JsonMap>)
          .map<SectionModel>((e) => SectionModel.fromJson(e))
          .toList());

  @override
  toJson() => {
        'name_': 'SetSection',
        'state_': {'list': _list.map((e) => e.toJson()).toList()},
      };
}
