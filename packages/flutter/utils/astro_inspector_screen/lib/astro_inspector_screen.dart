library astro_inspector_screen;

import 'package:astro/astro.dart' hide State;
import 'package:astro_widgets/astro_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';

import 'src/state/inspector_state.dart';
import 'src/views/main_view.dart';

export 'src/state/inspector_state.dart';
export 'src/utils/emit_mission_events.dart';

/// Visualise the data flow of an app by adding a [AstroInspectorScreen] widget
/// and passing in the `_events` stream from the Astro Store.
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
  final MissionControl<InspectorState> _store =
      MissionControl(state: InspectorState.initial);

  @override
  State<AstroInspectorScreen> createState() => _AstroInspectorScreenState();
}

class _AstroInspectorScreenState extends State<AstroInspectorScreen> {
  @override
  Widget build(BuildContext context) {
    return MissionControlProvider<InspectorState>(
        missionControl: widget._store, child: MainView(widget._events));
  }
}
