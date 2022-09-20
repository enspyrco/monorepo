import 'package:redaux/redaux.dart';

import '../enums/lineage_shape.dart';
import '../state/dev_tools_state.dart';

class SelectAction extends SyncAction<DevToolsState> {
  final int _index;

  SelectAction(this._index);

  int get index => _index;

  /// Select a list item and also identify the appropriate lineage to be drawn.
  @override
  DevToolsState land(state) => updateSelectedAndLineage(state, index);

  @override
  toJson({int? parentId}) => {
        'name_': 'SelectAction',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parentId,
        'state_': {'index': index}
      };
}

DevToolsState updateSelectedAndLineage(DevToolsState state, int index) {
  var lineageFor = <int, LineageShape>{};

  // Process the selected action
  lineageFor[index] = LineageShape.endpoint;
  int currentIndex = index;
  var parentId = state.dispatchEvents[currentIndex]['action']['parent_'];
  if (parentId == null) {
    // if first action is selected parent is null
    return state.copyWith(selectedIndex: index, lineageForIndex: {});
  }
  currentIndex = state.indexFor[parentId]!;

  // Move to the parent and process the action until there is no parent
  while (true) {
    parentId = state.dispatchEvents[currentIndex]['action']['parent_'];

    if (parentId == null) {
      lineageFor[currentIndex] = LineageShape.origin;
      break;
    }

    lineageFor[currentIndex] = LineageShape.connection;

    currentIndex = state.indexFor[parentId]!;
  }

  // Iterate over the actions from origin to endpoint and update anything unset
  // to `notConnection`.
  for (int i = index; i != currentIndex; i--) {
    lineageFor[i] ??= LineageShape.notConnection;
  }

  return state.copyWith(selectedIndex: index, lineageForIndex: lineageFor);
}
