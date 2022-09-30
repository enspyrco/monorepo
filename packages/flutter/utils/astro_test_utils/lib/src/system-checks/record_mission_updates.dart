import 'package:astro/astro.dart';

import '../state/mission_update.dart';

class RecordMissionUpdates<T extends RootState> extends SystemCheck<T> {
  final List<MissionUpdate> updates = [];
  final Map<Mission, T> stateForMission = {};

  @override
  void call(MissionControl<T> missionControl, Mission mission) async {
    updates.add(MissionUpdate(mission, missionControl.state));
    stateForMission[mission] = missionControl.state;
  }

  bool includes(Mission mission) => stateForMission[mission] != null;
}