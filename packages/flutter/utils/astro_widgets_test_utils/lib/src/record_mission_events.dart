import 'package:astro/astro.dart';

import 'mission_event.dart';

class RecordMissionEvents<T extends RootState> extends SystemCheck<T> {
  final List<MissionEvent> events = [];
  final Map<Mission, T> stateForMission = {};

  @override
  void call(MissionControl<T> store, Mission mission) async {
    events.add(MissionEvent(mission, store.state));
    stateForMission[mission] = store.state;
  }

  bool includes(Mission mission) => stateForMission[mission] != null;
}
