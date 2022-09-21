import 'package:astro/astro.dart';
import 'package:json_types/json_types.dart';

import '../state/inspector_state.dart';
import 'select_mission.dart';

/// Used for adding a mission event to the list.
/// Also sets the selected index to the new mission event.
/// The incoming json is assumed to have the form:
/// `{ mission: {id_ : <id>, ... }`
class AddMissionEvent extends DockingMission<InspectorState> {
  AddMissionEvent(this._eventJson);

  final JsonMap _eventJson;

  int get missionId => _eventJson['mission']['id_'];

  JsonMap get eventJson => JsonMap.unmodifiable(_eventJson);

  @override
  InspectorState dockingInstructions(state) {
    var newState = state.copyWith(
        missionEvents: [...state.missionEvents, eventJson],
        selectedIndex: state.missionEvents.length,
        indexForMissionId: {
          ...state.indexFor,
          missionId: state.missionEvents.length
        });
    return updateSelectedAndLineage(
        newState, newState.missionEvents.length - 1);
  }

  @override
  toJson({int? parentId}) => {
        'name_': 'AddMissionEvent',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId,
        'state_': {'event': eventJson}
      };
}
