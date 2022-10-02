import 'dart:async';
import 'dart:developer';

import 'package:astro/astro.dart';
import 'package:astro_core_interface/astro_core_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:json_types/json_types.dart';

class SendMissionUpdatesToInspector<T extends AstroState>
    extends SystemCheck<T> {
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
        'mission': mission.toJson()
      },
      'type': 'astro:mission_update'
    });

    // Post an event with state change information that our
    // Flutter DevTools plugin can listen for.
    postEvent('astro:mission_update',
        {'state': missionControl.state.toJson(), 'mission': mission.toJson()});
  }
}
