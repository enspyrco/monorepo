import 'package:astro/astro.dart';

import '../state/inspector_state.dart';

class RemoveMissionEvents extends LandingMission<InspectorState> {
  @override
  InspectorState landingInstructions(state) =>
      state.copyWith(selectedIndex: null);

  @override
  toJson({int? parentId}) => {
        'name_': 'RemoveDispatchEvents',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId
      };
}
