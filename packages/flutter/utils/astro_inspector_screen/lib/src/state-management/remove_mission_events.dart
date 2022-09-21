import 'package:astro/astro.dart';

import '../state/inspector_state.dart';

class RemoveMissionEvents extends DockingMission<InspectorState> {
  @override
  InspectorState dockingInstructions(state) =>
      state.copyWith(selectedIndex: null);

  @override
  toJson({int? parentId}) => {
        'name_': 'RemoveDispatchEvents',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId
      };
}
