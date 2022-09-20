import 'dart:async';

import 'package:json_types/json_types.dart';
import 'package:astro/astro.dart';

class EmitDispatchEvents<T extends RootState> extends SystemCheck<T> {
  final StreamController<JsonMap> _onDispatchController =
      StreamController<JsonMap>.broadcast();
  Stream<JsonMap> get onDispatch => _onDispatchController.stream;

  @override
  void call(store, Action action) async {
    // Emit json describing the action and (potential) state change on
    // each action dispatch.
    _onDispatchController.add({
      'data': {
        'state': store.state.toJson(),
        'action': action.toJson(parentId: action.parent?.hashCode)
      },
      'type': 'redfire:action_dispatched'
    });
  }
}
