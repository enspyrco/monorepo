import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../events/events_model.dart';
import 'action_history_item.dart';

class ActionsHistoryView extends StatelessWidget {
  const ActionsHistoryView(this._model);

  final EventsModel _model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ListView.builder(
          itemCount: _model.events.length,
          itemBuilder: (context, index) {
            final actionMap = _model.events[index]['action'];
            if (actionMap == null) {
              return Container();
            }
            return ActionHistoryItem(
                currentlySelected: index == _model.selectedIndex,
                actionName: actionMap['description'],
                actionState: actionMap['json'],
                onTap: () => _model.setSelected(index));
          }),
    );
  }
}
