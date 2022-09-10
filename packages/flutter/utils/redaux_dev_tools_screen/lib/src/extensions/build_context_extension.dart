import 'package:flutter/widgets.dart' show BuildContext;
import 'package:redaux/redaux.dart' show Action;
import 'package:redaux_widgets/widgets/store_provider.dart' show StoreProvider;

import '../state/dev_tools_state.dart';

/// Syntax sugar for dispatching redaux actions
extension BuildContextExtension on BuildContext {
  void dispatch(Action action) =>
      StoreProvider.of<DevToolsState>(this).dispatch(action);
}
