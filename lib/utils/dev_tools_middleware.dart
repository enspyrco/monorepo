import 'dart:developer';

import 'package:redfire/types/red_fire_state.dart';
import 'package:redfire/types/redux_action.dart';
import 'package:redux/redux.dart';

class DevToolsMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, ReduxAction> {
  DevToolsMiddleware()
      : super((store, action, next) async {
          next(action);

          postEvent('redfire:action_dispatched', {
            'state_json': store.state.toJson(),
            'action': {
              'description': action.toString(),
              'json': action.toJson()
            }
          });
        });
}
