import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/state_changes.dart';
import 'action_history_item.dart';

class ActionsHistoryView extends StatelessWidget {
  const ActionsHistoryView(this._stateChanges, {super.key});

  final StateChanges _stateChanges;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ListView.builder(
          itemCount: _stateChanges.events.length,
          itemBuilder: (context, index) {
            final actionMap = _stateChanges.events[index]['action'];
            if (actionMap == null) {
              return Container();
            }
            return ActionHistoryItem(
                currentlySelected: index == _stateChanges.selectedIndex,
                actionName: actionMap['description'],
                actionState: actionMap['json'],
                onTap: () => _stateChanges.setSelected(index));
          }),
    );
  }
}
