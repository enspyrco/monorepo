import 'package:flutter/material.dart';

class OrganisationSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            height: 40,
            child: Text('Organisation Selection')));
  }
}
