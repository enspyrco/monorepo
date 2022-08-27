import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';

import 'action_history/actions_history_view.dart';
import 'app_state/app_state_view.dart';
import 'models/dispatch_events.dart';

/// When used by the DevTools plugin, `serviceManager.service?.onExtensionEvent`
/// is transformed to a Stream<ReduxStateEvent>.
///
/// Listens to a [Stream] of events from [redfire] and keeps
/// a [StreamSubscription] for canceling on dispose.
///
/// Events consist of an action and the corresponding app state.
///
/// Each event is added to the [EventsModel] which is passed down for display
/// by child widgets.
class ReduxDevToolsScreen extends StatefulWidget {
  const ReduxDevToolsScreen(this.eventsStream, {Key? key}) : super(key: key);

  // An event could be a 'dispatch' event or a 'remove all' event
  final Stream<JsonMap>? eventsStream;

  @override
  State<ReduxDevToolsScreen> createState() => _ReduxDevToolsScreenState();
}

class _ReduxDevToolsScreenState extends State<ReduxDevToolsScreen> {
  final _dispatchEvents = DispatchEvents();
  StreamSubscription<JsonMap>? _subscription;
  final Map<String, JsonMap> eventFor = {};

  @override
  void initState() {
    super.initState();

    if (widget.eventsStream != null) {
      _subscription = widget.eventsStream!.listen((event) {
        if (event['type'] == 'redfire:action_dispatched') {
          _dispatchEvents.add(event['data']);
        } else if (event['type'] == 'redfire:remove_all') {
          _dispatchEvents.removeAll();
        }
      });
      _dispatchEvents.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.eventsStream == null)
        ? const Text('Not connected to app...')
        : Row(
            children: [
              ActionsHistoryView(_dispatchEvents),
              AppStateView(_dispatchEvents),
            ],
          );
  }
}
