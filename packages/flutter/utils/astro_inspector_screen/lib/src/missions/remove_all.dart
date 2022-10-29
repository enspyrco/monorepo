import 'package:astro_types/core_types.dart';

import '../state/inspector_state.dart';

/// A [RemoveAll] landing mission is started when the app sends a
/// `remove_all` event to reset the Inspector Screen.
class RemoveAll extends LandingMission<InspectorState> {
  @override
  InspectorState landingInstructions(state) =>
      state.copyWith(selectedIndex: null, missionUpdates: []);

  @override
  toJson() => {'name_': 'RemoveAll', 'state_': <String, dynamic>{}};
}
