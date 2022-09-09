import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';
import 'package:redaux_dev_tools_screen/src/state/dev_tools_state.dart';
import 'package:redaux_widgets/widgets/state_stream_builder.dart';

import 'action_history_item.dart';

class ActionsHistoryView extends StatelessWidget {
  const ActionsHistoryView({super.key});

  // this._dispatchEvents, this._selectAction, this._showErrorMessage,
  // final DevToolsState _dispatchEvents;
  // final Function(int, Function(ErrorMessage)) _selectAction;
  // final Function(ErrorMessage) _showErrorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5), // so starting space is same as the gaps
        Expanded(
          child: SizedBox(
            width: 300,
            child: StateStreamBuilder<DevToolsState, List<JsonMap>>(
                transformer: (state) => state.dispatchEvents,
                builder: (context, dispatchEvents) {
                  return ListView.builder(
                      itemCount: dispatchEvents.length,
                      itemBuilder: (context, index) {
                        final actionData = dispatchEvents[index]['action'];
                        if (actionData == null) {
                          return Container();
                        }
                        return ActionHistoryItem(
                          // isSelected: index == dispatchEvents.selectedIndex,
                          actionName: actionData['name_'],
                          actionType: actionData['type_'],
                          actionState: actionData['state_'],
                          // lineage: _dispatchEvents.lineageFor[index],
                          index: index,
                        );
                      });
                }),
          ),
        )
      ],
    );
  }
}
