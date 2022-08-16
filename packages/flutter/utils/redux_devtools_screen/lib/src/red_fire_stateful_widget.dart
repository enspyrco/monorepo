import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:vm_service/vm_service.dart';

import 'action_history/actions_history_view.dart';
import 'app_state/app_state_view.dart';
import 'events/events_model.dart';

/// Requires `serviceManager.service!.onExtensionEvent` to be passed in.
///
/// Listens to a [Stream] of events from [redfire] and keeps
/// a [StreamSubscription] for canceling on dispose.
///
/// Events consist of an action and the corresponding app state.
///
/// Each event is added to the [EventsModel] which is passed down for display
/// by child widgets.
class RedFireStatefulWidget extends StatefulWidget {
  const RedFireStatefulWidget(this.eventsStream, {Key? key}) : super(key: key);

  final Stream<Event> eventsStream;

  @override
  State<RedFireStatefulWidget> createState() => _RedFireStatefulWidgetState();
}

class _RedFireStatefulWidgetState extends State<RedFireStatefulWidget> {
  final _model = EventsModel();
  StreamSubscription<Event>? _eventsSubscription;

  @override
  void initState() {
    super.initState();
    _eventsSubscription = widget.eventsStream
        .where((event) => event.extensionKind?.startsWith('redfire:') ?? false)
        .listen((event) {
      if (event.extensionKind == 'redfire:action_dispatched') {
        _model.add(event.extensionData!.data);
      } else if (event.extensionKind == 'redfire:remove_all') {
        _model.removeAll();
      }
    });
    _model.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [ActionsHistoryView(_model), AppStateView(_model)]);
  }
}
