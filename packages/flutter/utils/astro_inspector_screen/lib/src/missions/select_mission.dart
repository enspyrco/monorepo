import 'package:astro/astro.dart';

import '../enums/lineage_shape.dart';
import '../state/inspector_state.dart';

class SelectMission extends LandingMission<InspectorState> {
  final int _index;

  SelectMission(this._index);

  int get index => _index;

  /// Select a list item and also identify the appropriate lineage to be drawn.
  @override
  InspectorState landingInstructions(state) =>
      updateSelectedAndLineage(state, index);

  @override
  toJson() => {
        'name_': 'SelectMission',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parent?.hashCode,
        'state_': {'index': index}
      };
}

/// Used by [SelectMission] & [AddMissionUpdate] to select a mission and
/// calculate how each list item is involved in the lineage. There are 5
/// possibilities - in between the `origin` and the `endpoint` the list items
/// are either a `connection` (one of the missions in the the lineage) or
/// `notConnection` (not in the sequence). Any items beyond the origin have
/// `null` and do not have any lineage drawn.
InspectorState updateSelectedAndLineage(InspectorState state, int index) {
  var lineageFor = <int, LineageShape>{};

  // Process the selected mission
  lineageFor[index] = LineageShape.endpoint;
  int currentIndex = index;
  var parentId = state.missionUpdates[currentIndex]['mission']['parent_'];
  if (parentId == null) {
    // if first mission is selected parent is null
    return state.copyWith(selectedIndex: index, lineageFor: {});
  }
  currentIndex = state.indexFor[parentId]!;

  // Move to the parent and process the mission until there is no parent
  while (true) {
    parentId = state.missionUpdates[currentIndex]['mission']['parent_'];

    if (parentId == null) {
      lineageFor[currentIndex] = LineageShape.origin;
      break;
    }

    lineageFor[currentIndex] = LineageShape.connection;

    currentIndex = state.indexFor[parentId]!;
  }

  // Iterate over the missions from origin to endpoint and update anything unset
  // to `notConnection`.
  for (int i = index; i != currentIndex; i--) {
    lineageFor[i] ??= LineageShape.notConnection;
  }

  return state.copyWith(selectedIndex: index, lineageFor: lineageFor);
}
