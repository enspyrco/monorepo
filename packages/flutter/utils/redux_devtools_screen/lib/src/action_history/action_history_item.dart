import 'package:flutter/material.dart';

class ActionHistoryItem extends StatelessWidget {
  const ActionHistoryItem({
    Key? key,
    required this.actionName,
    required this.actionState,
    required this.onTap,
    required this.currentlySelected,
  }) : super(key: key);

  final String actionName;
  final Map<String, dynamic> actionState;
  final Function onTap;
  final bool currentlySelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(actionName),
      subtitle: currentlySelected ? Text(actionState.toString()) : Container(),
      onTap: () => onTap(),
    );
  }
}
