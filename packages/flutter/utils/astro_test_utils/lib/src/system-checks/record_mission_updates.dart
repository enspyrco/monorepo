import 'package:astro/astro.dart';
import 'package:astro_core_interface/astro_core_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';

import '../state/mission_update.dart';

class RecordMissionUpdates<T extends AstroState> extends SystemCheck<T> {
  final List<MissionUpdate> updates = [];
  final Map<Mission, T> stateForMission = {};

  @override
  void call(MissionControl<T> missionControl, Mission mission) async {
    updates.add(MissionUpdate(mission, missionControl.state));
    stateForMission[mission] = missionControl.state;
  }

  bool includes(Mission mission) => stateForMission[mission] != null;
}
