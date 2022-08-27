import 'dart:developer';

import 'package:redux/redux.dart';

import '../types/red_fire_state.dart';
import '../types/redux_action.dart';

class DevToolsMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, ReduxAction> {
  DevToolsMiddleware()
      : super((store, action, next) async {
          next(action);

          final className = action.toString();
          String actionName = className[0];
          int i = 1;
          while (i < className.length) {
            if (className[i] == '(') break;
            if (className[i] == className[i].toUpperCase()) actionName += ' ';
            actionName += className[i];
            i++;
          }
          actionName = actionName.substring(0, actionName.length - 7);

          var data = <String, Object?>{
            'state_json': store.state.toJson(),
            'action': {'description': actionName, 'json': action.toJson()}
          };

          // Post an event with state change information that our
          // Flutter DevTools plugin can listen for.
          postEvent('redfire:action_dispatched', data);
        }) {
    // When the middleware is created, send an event to clear data from devtools.
    // This is useful when user performs a hot restart.
    postEvent('redfire:remove_all', <String, Object?>{});
  }
}
