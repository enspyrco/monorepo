import 'package:flutter/material.dart';

import '../enums/lineage_shape.dart';

class ActionHistoryItem extends StatelessWidget {
  const ActionHistoryItem({
    Key? key,
    required this.actionName,
    required this.actionType,
    required this.actionState,
    required this.onTap,
    required this.isSelected,
    this.lineage,
  }) : super(key: key);

  final String actionName;
  final String actionType;
  final Map<String, dynamic> actionState;
  final Function onTap;
  final bool isSelected;
  final LineageShape? lineage;

  @override
  Widget build(BuildContext context) {
    var isAsync = actionType == 'async';

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
                      width: isSelected ? 3 : 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                title: Text(actionName),
                subtitle:
                    isSelected ? Text(actionState.toString()) : Container(),
                onTap: () => onTap(),
                tileColor: isAsync ? Colors.green[50] : Colors.blue[50]),
          ),
        ),
        if (lineage != null) ...lineage!.shapeWidgets
      ],
    );
  }
}
