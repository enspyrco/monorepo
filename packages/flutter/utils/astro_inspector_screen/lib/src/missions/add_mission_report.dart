import 'package:astro_types/core_types.dart';
import 'package:astro_types/json_types.dart';

import '../state/inspector_state.dart';
import 'select_mission.dart';

/// Used for adding a mission update to the list.
/// Also sets the selected index to the new mission update.
/// The incoming json is assumed to have the form:
/// `{ mission: {id_ : <id>, ... }`
class AddMissionReport extends LandingMission<InspectorState> {
  AddMissionReport(this._missionReportJson);

  final JsonMap _missionReportJson;

  int get missionId => _missionReportJson['mission']['id_'];

  JsonMap get eventJson => JsonMap.unmodifiable(_missionReportJson);

  @override
  InspectorState landingInstructions(state) {
    var newState = state.copyWith(
        missionReports: [...state.missionReports, eventJson],
        selectedIndex: state.missionReports.length,
        indexFor: {...state.indexFor, missionId: state.missionReports.length});
    return updateSelectedAndLineage(
        newState, newState.missionReports.length - 1);
  }

  @override
  toJson() => {
        'name_': 'Add Mission Update',
        'state_': {'event': eventJson}
      };
}
