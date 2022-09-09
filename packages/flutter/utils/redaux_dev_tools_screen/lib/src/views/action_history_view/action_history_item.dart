import 'package:flutter/material.dart' hide SelectAction;
import 'package:redaux_widgets/widgets/state_stream_builder.dart';

import '../../extensions/build_context_extension.dart';
import '../../state-management/select_action.dart';
import '../../state/dev_tools_state.dart';
import '../../state/viewmodels/action_history_item_view_model.dart';

class ActionHistoryItem extends StatelessWidget {
  const ActionHistoryItem({
    Key? key,
    required this.actionName,
    required this.actionType,
    required this.actionState,
    required this.index,
  }) : super(key: key);

  final String actionName;
  final String actionType;
  final Map<String, dynamic> actionState;
  final int index;

  @override
  Widget build(BuildContext context) {
    var isAsync = actionType == 'async';

    return StateStreamBuilder<DevToolsState, ActionHistoryItemViewModel>(
        transformer: (state) {
      return ActionHistoryItemViewModel(
          index == state.selectedIndex, state.lineageFor[index]?.shapeWidgets);
    }, builder: (context, vm) {
      return Stack(
        children: [
          SizedBox(
            height: 80,
            child: Padding(
              padding: EdgeInsets.only(
                  left: isAsync ? 5 : 20,
                  top: 5,
                  right: isAsync ? 20 : 5,
                  bottom: 5),
              child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: isAsync ? Colors.green : Colors.blue,
                        width: vm.isSelected ? 3 : 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(actionName),
                  subtitle: vm.isSelected
                      ? Text(actionState.toString())
                      : Container(),
                  onTap: () => context.dispatch(SelectAction(index)),
                  tileColor: isAsync ? Colors.green[50] : Colors.blue[50]),
            ),
          ),
          if (vm.lineageShapes != null) ...vm.lineageShapes!
        ],
      );
    });
  }
}
