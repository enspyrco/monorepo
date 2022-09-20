import 'package:flutter/widgets.dart' show BuildContext;
import 'package:redaux/redaux.dart' show SyncAction, AsyncAction;
import 'package:redaux_widgets/widgets/store_provider.dart' show StoreProvider;

import '../state/dev_tools_state.dart';

/// Syntax sugar for launching and landing redaux actions
extension BuildContextExtension on BuildContext {
  void launch(AsyncAction<DevToolsState> action) =>
      StoreProvider.of<DevToolsState>(this).launch(action);
  void land(SyncAction<DevToolsState> action) =>
      StoreProvider.of<DevToolsState>(this).land(action);
}
