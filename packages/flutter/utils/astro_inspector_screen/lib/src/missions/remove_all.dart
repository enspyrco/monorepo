import 'package:astro/astro.dart';

import '../state/inspector_state.dart';

/// A [RemoveAll] landing mission is started when the app sends a
/// `remove_all` event to reset the Inspector Screen.
class RemoveAll extends LandingMission<InspectorState> {
  @override
  InspectorState landingInstructions(state) =>
      state.copyWith(selectedIndex: null, missionUpdates: []);

  @override
  toJson({int? parentId}) => {
        'name_': 'RemoveAll',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId
      };
}
