import 'package:astro/astro.dart';

import '../state/dev_tools_state.dart';

class RemoveMissionEvents extends DockingMission<DevToolsState> {
  @override
  DevToolsState dockingInstructions(state) =>
      state.copyWith(selectedIndex: null);

  @override
  toJson({int? parentId}) => {
        'name_': 'RemoveDispatchEvents',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId
      };
}
