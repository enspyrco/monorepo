import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';

import '../extensions/build_context_extension.dart';
import '../state-management/add_dispatch_event.dart';
import '../state-management/remove_dispatch_events.dart';
import 'action_history_view/actions_history_view.dart';
import 'app_state_view/app_state_view.dart';

/// The [MainView] lays out the [ActionsHistoryView] and [AppStateView].
///
/// The [MainView] takes a [Stream] of dispatch events from [redaux], listens to
/// the stream and dispatches an appropriate Action (as we are also using redaux
/// for our state management) for each incoming event.
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
        if (event['type'] == 'redfire:action_dispatched') {
          context.dispatch(AddDispatchEvent(event['data']));
        } else if (event['type'] == 'redfire:remove_all') {
          context.dispatch(RemoveDispatchEvents());
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
              const ActionsHistoryView(),
              AppStateView(),
            ],
          );
  }
}
