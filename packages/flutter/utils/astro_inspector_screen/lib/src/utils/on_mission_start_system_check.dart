import 'dart:async';

import 'package:astro/astro.dart';
import 'package:json_types/json_types.dart';

class OnMissionStartSystemCheck<T extends RootState> extends SystemCheck<T> {
  final StreamController<JsonMap> _controller =
      StreamController<JsonMap>.broadcast();
  Stream<JsonMap> get stream => _controller.stream;

  @override
  void call(MissionControl missionControl, Mission mission) async {
    // Emit json describing the mission and (potential) state change on
    // each mission.
    _controller.add({
      'data': {
        'state': missionControl.state.toJson(),
        'mission': mission.toJson(parentId: mission.parent?.hashCode)
      },
      'type': 'redfire:mission_started'
    });
  }
}
