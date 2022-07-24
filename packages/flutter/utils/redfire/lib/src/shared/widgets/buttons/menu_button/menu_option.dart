import 'package:flutter/widgets.dart';

import '../../../../redux/extensions/build_context_extensions.dart';
import '../../../../types/red_fire_state.dart';
import '../../../../types/redux_action.dart';

class MenuOption {
  MenuOption(this.name, this.action);

  final String name;
  final ReduxAction action;

  dynamic dispatchAction<T extends RedFireState>(BuildContext context) =>
      context.dispatch<T>(action);
}
