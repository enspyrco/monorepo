library astro_inspector_screen;

import 'package:astro/astro.dart' hide State;
import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';

import 'astro_inspector_screen.dart';
import 'src/views/main_view.dart';

export 'src/state/inspector_state.dart';
export 'src/utils/on_mission_start_system_check.dart';

/// Visualise the data flow of an app by adding a [AstroInspectorScreen] widget
/// and passing in the `_events` stream from the astro [MissionControl].
/// When used by the Inspector plugin, `serviceManager.service?.onExtensionEvent`
/// is transformed to a Stream<ReduxStateEvent>.
///
/// At this time, an event is either
/// - a 'mission' event, consisting of the mission object and any corresponding
///   state change.
/// - a 'remove all' event to clear the mission events data.
class AstroInspectorScreen extends StatefulWidget {
  AstroInspectorScreen(this._events, {super.key});

  final Stream<JsonMap>? _events;
  final MissionControl<InspectorState> _missionControl =
      MissionControl(state: InspectorState.initial);

  @override
  State<AstroInspectorScreen> createState() => _AstroInspectorScreenState();
}

class _AstroInspectorScreenState extends State<AstroInspectorScreen> {
  @override
  Widget build(BuildContext context) {
    return MissionControlProvider<InspectorState>(
        missionControl: widget._missionControl,
        child: MainView(widget._events));
  }
}
