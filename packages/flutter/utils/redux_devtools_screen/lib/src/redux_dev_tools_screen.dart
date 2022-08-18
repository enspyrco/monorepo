import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:redux_devtools_screen/src/models/redux_state_event.dart';

import 'action_history/actions_history_view.dart';
import 'app_state/app_state_view.dart';
import 'models/state_changes.dart';

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

  final Stream<ReduxStateEvent>? eventsStream;

  @override
  State<ReduxDevToolsScreen> createState() => _ReduxDevToolsScreenState();
}

class _ReduxDevToolsScreenState extends State<ReduxDevToolsScreen> {
  final _stateChanges = StateChanges();
  StreamSubscription<ReduxStateEvent>? _eventsSubscription;

  @override
  void initState() {
    super.initState();

    if (widget.eventsStream != null) {
      _eventsSubscription = widget.eventsStream!.listen((event) {
        if (event.type == 'redfire:action_dispatched') {
          _stateChanges.add(event.data);
        } else if (event.type == 'redfire:remove_all') {
          _stateChanges.removeAll();
        }
      });
      _stateChanges.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.eventsStream == null)
        ? const Text('Not connected to app...')
        : Row(
            children: [
              ActionsHistoryView(_stateChanges),
              AppStateView(_stateChanges),
            ],
          );
  }
}
