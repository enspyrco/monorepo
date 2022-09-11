import 'dart:async';

import 'package:json_types/json_types.dart';
import 'package:redaux/redaux.dart';

class EmitDispatchEventsEndware<T extends RootState> extends Endware<T> {
  final StreamController<JsonMap> _dispatchEventsController =
      StreamController<JsonMap>.broadcast();
  Stream<JsonMap> get dispatchEvents => _dispatchEventsController.stream;

  @override
  void call(store, Action action) async {
    // Emit json describing the action and (potential) state change on
    // each action dispatch.
    _dispatchEventsController.add({
      'data': {
        'state': store.state.toJson(),
        'action': action.toJson(parentId: action.parent?.hashCode)
      },
      'type': 'redfire:action_dispatched'
    });
  }
}
