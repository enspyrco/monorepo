import 'package:astro/astro.dart';

import '../state/inspector_state.dart';

/// A [RemoveMissionEvents] landing mission is started when the app sends a
/// `remove_all` event and resets the
class RemoveMissionEvents extends LandingMission<InspectorState> {
  @override
  InspectorState landingInstructions(state) =>
      state.copyWith(selectedIndex: null, missionEvents: []);

  @override
  toJson({int? parentId}) => {
        'name_': 'RemoveMissionEvents',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId
      };
}
