import 'dart:developer';

import 'package:redux/redux.dart';

import '../types/red_fire_state.dart';
import '../types/redux_action.dart';

class DevToolsMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, ReduxAction> {
  DevToolsMiddleware()
      : super((store, action, next) async {
          next(action);

          postEvent('redfire:action_dispatched', <String, Object?>{
            'state_json': store.state.toJson(),
            'action': {
              'description': action.toString().split('(').first,
              'json': action.toJson()
            }
          });
        }) {
    // When the middleware is created, send an event to clear data from devtools.
    // This is useful when user performs a hot restart.
    postEvent('redfire:remove_all', <String, Object?>{});
  }
}
