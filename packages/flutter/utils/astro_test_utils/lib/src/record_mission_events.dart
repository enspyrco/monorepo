import 'package:astro/astro.dart';

import 'mission_event.dart';

class RecordMissionEvents<T extends RootState> extends SystemCheck<T> {
  final List<MissionEvent> events = [];
  final Map<Mission, T> stateForMission = {};

  @override
  void call(MissionControl<T> missionControl, Mission mission) async {
    events.add(MissionEvent(mission, missionControl.state));
    stateForMission[mission] = missionControl.state;
  }

  bool includes(Mission mission) => stateForMission[mission] != null;
}
