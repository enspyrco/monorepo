import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';

import '../extensions/build_context_extension.dart';
import '../state-management/add_mission_event.dart';
import '../state-management/remove_mission_events.dart';
import 'app_state_view/app_state_view.dart';
import 'missions_history_view/missions_history_view.dart';

/// The [MainView] lays out the [MissionsHistoryView] and [AppStateView].
///
/// The [MainView] takes a [Stream] of mission events from [MissionControl],
/// listens to the stream and starts an appropriate Mission (as we are also
/// using astro for our state management) for each incoming event.
class MainView extends StatefulWidget {
  const MainView(this._eventsStream, {super.key});

  final Stream<JsonMap>? _eventsStream;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  StreamSubscription<JsonMap>? _subscription;

  @override
  void initState() {
    super.initState();

    if (widget._eventsStream != null) {
      _subscription = widget._eventsStream!.listen((event) {
        if (event['type'] == 'redfire:mission_started') {
          context.land(AddMissionEvent(event['data']));
        } else if (event['type'] == 'redfire:remove_all') {
          context.land(RemoveMissionEvents());
        }
      });
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (widget._eventsStream == null)
        ? const Text('Not connected to app...')
        : Row(
            children: [
              const MissionsHistoryView(),
              AppStateView(),
            ],
          );
  }
}
