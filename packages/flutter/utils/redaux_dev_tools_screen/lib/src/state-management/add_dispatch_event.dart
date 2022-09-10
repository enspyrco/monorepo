import 'package:json_types/json_types.dart';
import 'package:redaux/redaux.dart';

import '../state/dev_tools_state.dart';
import 'select_action.dart';

class AddDispatchEvent extends SyncAction<DevToolsState> {
  AddDispatchEvent(this._event);

  final JsonMap _event;

  int get actionId => _event['action']['id_'];

  JsonMap get event => JsonMap.unmodifiable(_event);

  @override
  Reducer<DevToolsState> get reducer => _AddDispatchEventReducer.instance;

  @override
  toJson({int? parentId}) => {
        'name_': 'AddDispatchEvent',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId,
        'state_': {'event': event}
      };
}

class _AddDispatchEventReducer extends Reducer<DevToolsState> {
  @override
  DevToolsState call(state, covariant AddDispatchEvent action) {
    var newState = state.copyWith(
        dispatchEvents: [...state.dispatchEvents, action.event],
        selectedIndex: state.dispatchEvents.length,
        indexForActionId: {
          ...state.indexFor,
          action.actionId: state.dispatchEvents.length
        });
    return updateSelectedAndLineage(
        newState, newState.dispatchEvents.length - 1);
  }

  static final instance = _AddDispatchEventReducer();
}
