library astro_dev_tools_screen;

import 'package:astro/astro.dart' hide State;
import 'package:astro_widgets/astro_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';

import 'astro_dev_tools_screen.dart';
import 'src/views/main_view.dart';

export 'src/state/dev_tools_state.dart';
export 'src/utils/emit_dispatch_events.dart';

/// Visualise the data flow of an app by adding a [AstroDevToolsScreen] widget
/// and passing in the `_events` stream from the Astro Store.
/// When used by the DevTools plugin, `serviceManager.service?.onExtensionEvent`
/// is transformed to a Stream<ReduxStateEvent>.
///
/// At this time, an event is either
/// - a 'dispatch' event, consisting of the dispatched action and corresponding
///   app state.
/// - a 'remove all' event to clear the dispatch events data.
class AstroDevToolsScreen extends StatefulWidget {
  AstroDevToolsScreen(this._events, {super.key});

  final Stream<JsonMap>? _events;
  final Store<DevToolsState> _store = Store(state: DevToolsState.initial);

  @override
  State<AstroDevToolsScreen> createState() => _AstroDevToolsScreenState();
}

class _AstroDevToolsScreenState extends State<AstroDevToolsScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<DevToolsState>(
        store: widget._store, child: MainView(widget._events));
  }
}
