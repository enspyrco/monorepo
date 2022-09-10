library redaux_dev_tools_screen;

import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';
import 'package:redaux/redaux.dart' hide State;
import 'package:redaux_widgets/redaux_widget.dart';

import 'redaux_dev_tools_screen.dart';
import 'src/views/main_view.dart';

export 'src/state/dev_tools_state.dart';

/// Visualise the data flow of an app by adding a [RedauxDevToolsScreen] widget
/// and passing in the `dispatchEvents` stream from the Redaux Store.
/// When used by the DevTools plugin, `serviceManager.service?.onExtensionEvent`
/// is transformed to a Stream<ReduxStateEvent>.
///
/// At this time, an event is either
/// - a 'dispatch' event, consisting of the dispatched action and corresponding
///   app state.
/// - a 'remove all' event to clear the dispatch events data.
class RedauxDevToolsScreen extends StatefulWidget {
  const RedauxDevToolsScreen(this._eventsStream, this._store, {super.key});

  final Stream<JsonMap>? _eventsStream;
  final Store<DevToolsState> _store;

  @override
  State<RedauxDevToolsScreen> createState() => _RedauxDevToolsScreenState();
}

class _RedauxDevToolsScreenState extends State<RedauxDevToolsScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<DevToolsState>(
        store: widget._store, child: MainView(widget._eventsStream));
  }
}
