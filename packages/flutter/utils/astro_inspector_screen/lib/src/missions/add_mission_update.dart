import 'package:astro/astro.dart';
import 'package:json_types/json_types.dart';

import '../state/inspector_state.dart';
import 'select_mission.dart';

/// Used for adding a mission update to the list.
/// Also sets the selected index to the new mission update.
/// The incoming json is assumed to have the form:
/// `{ mission: {id_ : <id>, ... }`
class AddMissionUpdate extends LandingMission<InspectorState> {
  AddMissionUpdate(this._eventJson);

  final JsonMap _eventJson;

  int get missionId => _eventJson['mission']['id_'];

  JsonMap get eventJson => JsonMap.unmodifiable(_eventJson);

  @override
  InspectorState landingInstructions(state) {
    var newState = state.copyWith(
        missionUpdates: [...state.missionUpdates, eventJson],
        selectedIndex: state.missionUpdates.length,
        indexFor: {...state.indexFor, missionId: state.missionUpdates.length});
    return updateSelectedAndLineage(
        newState, newState.missionUpdates.length - 1);
  }

  @override
  toJson({int? parentId}) => {
        'name_': 'AddMissionUpdate',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId,
        'state_': {'event': eventJson}
      };
}
