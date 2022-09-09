import 'package:redaux/redaux.dart';

import '../state/dev_tools_state.dart';

class RemoveDispatchEvents extends SyncAction<DevToolsState> {
  @override
  Reducer<DevToolsState> get reducer => _RemoveDispatchEventsReducer.instance;

  @override
  toJson({int? parentId}) => {
        'name_': 'RemoveDispatchEvents',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId
      };
}

class _RemoveDispatchEventsReducer extends Reducer<DevToolsState> {
  @override
  DevToolsState call(state, covariant RemoveDispatchEvents action) =>
      state.copyWith(selectedIndex: null);

  static final instance = _RemoveDispatchEventsReducer();
}
