import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/dispatch_events.dart';
import 'action_history_item.dart';

class ActionsHistoryView extends StatelessWidget {
  const ActionsHistoryView(this._dispatchEvents, {super.key});

  final DispatchEvents _dispatchEvents;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5), // so starting space is same as the gaps
        Expanded(
          child: SizedBox(
            width: 300,
            child: ListView.builder(
                itemCount: _dispatchEvents.events.length,
                itemBuilder: (context, index) {
                  final actionData = _dispatchEvents.events[index]['action'];
                  if (actionData == null) {
                    return Container();
                  }
                  return ActionHistoryItem(
                    isSelected: index == _dispatchEvents.selectedIndex,
                    actionName: actionData['name_'],
                    actionType: actionData['type_'],
                    actionState: actionData['state_'],
                    onTap: () => _dispatchEvents.setSelected(index),
                    lineage: _dispatchEvents.lineageFor[index],
                  );
                }),
          ),
        )
      ],
    );
  }
}
