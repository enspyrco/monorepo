import 'dart:async';

import 'package:astro/astro.dart';
import 'package:json_types/json_types.dart';

class EmitMissionEvents<T extends RootState> extends SystemCheck<T> {
  final StreamController<JsonMap> _onMissionStartController =
      StreamController<JsonMap>.broadcast();
  Stream<JsonMap> get onDispatch => _onMissionStartController.stream;

  @override
  void call(missionControl, Mission mission) async {
    // Emit json describing the mission and (potential) state change on
    // each mission.
    _onMissionStartController.add({
      'data': {
        'state': missionControl.state.toJson(),
        'mission': mission.toJson(parentId: mission.parent?.hashCode)
      },
      'type': 'redfire:mission_started'
    });
  }
}
