import 'package:json_types/json_types.dart';
import 'package:redaux/redaux.dart';

import '../state/dev_tools_state.dart';
import 'select_action.dart';

class AddDispatchEvent extends SyncAction<DevToolsState> {
  AddDispatchEvent(this._eventJson);

  final JsonMap _eventJson;

  int get actionId => _eventJson['action']['id_'];

  JsonMap get eventJson => JsonMap.unmodifiable(_eventJson);

  @override
  DevToolsState land(state) {
    var newState = state.copyWith(
        dispatchEvents: [...state.dispatchEvents, eventJson],
        selectedIndex: state.dispatchEvents.length,
        indexForActionId: {
          ...state.indexFor,
          actionId: state.dispatchEvents.length
        });
    return updateSelectedAndLineage(
        newState, newState.dispatchEvents.length - 1);
  }

  @override
  toJson({int? parentId}) => {
        'name_': 'AddDispatchEvent',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId,
        'state_': {'event': eventJson}
      };
}
