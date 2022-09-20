import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';
import 'package:redaux_widgets/redaux_widget.dart';

import '../../../astro_dev_tools_screen.dart';
import 'actions_history_item.dart';

class ActionsHistoryView extends StatelessWidget {
  const ActionsHistoryView({super.key});

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
                        return ActionsHistoryItem(
                          actionName: actionData['name_'],
                          actionType: actionData['type_'],
                          actionState: actionData['state_'],
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
