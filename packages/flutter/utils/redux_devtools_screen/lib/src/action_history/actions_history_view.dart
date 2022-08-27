import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';

import '../models/dispatch_events.dart';
import 'action_history_item.dart';

class ActionsHistoryView extends StatelessWidget {
  const ActionsHistoryView(this._dispatchEvents, {super.key});

  final DispatchEvents _dispatchEvents;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ListView.builder(
          itemCount: _dispatchEvents.events.length,
          itemBuilder: (context, index) {
            final actionMap =
                _dispatchEvents.events[index]['action'] as JsonMap?;
            if (actionMap == null) {
              return Container();
            }
            return ActionHistoryItem(
                currentlySelected: index == _dispatchEvents.selectedIndex,
                actionName: actionMap['description'] as String,
                actionState: actionMap['json'] as JsonMap,
                onTap: () => _dispatchEvents.setSelected(index));
          }),
    );
  }
}
