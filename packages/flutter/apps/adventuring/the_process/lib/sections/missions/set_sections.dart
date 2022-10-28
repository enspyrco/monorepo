import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';
import '../../projects/models/section_model.dart';

class SetSections extends LandingMission<AppState> {
  SetSections({required List<SectionModel> list}) : _list = list;

  List<SectionModel> _list;

  @override
  AppState landingInstructions(AppState state) {
    var newSections = state.sections.copyWith(list: _list);
    return state.copyWith(sections: newSections);
  }

  @override
  toJson() => {
        'name_': 'SetSection',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parent?.hashCode,
        'state_': {'list': _list.map((e) => e.toJson()).toList()},
      };
}
