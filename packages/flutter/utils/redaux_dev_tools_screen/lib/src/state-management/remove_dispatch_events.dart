import 'package:redaux/redaux.dart';

import '../state/dev_tools_state.dart';

class RemoveDispatchEvents extends SyncAction<DevToolsState> {
  @override
  DevToolsState arrive(state) => state.copyWith(selectedIndex: null);

  @override
  toJson({int? parentId}) => {
        'name_': 'RemoveDispatchEvents',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId
      };
}
