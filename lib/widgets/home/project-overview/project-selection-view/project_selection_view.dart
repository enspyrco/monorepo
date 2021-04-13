import 'package:flutter/material.dart';

class ProjectSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            height: 40,
            child: Text('Project Selection')));
  }
}
