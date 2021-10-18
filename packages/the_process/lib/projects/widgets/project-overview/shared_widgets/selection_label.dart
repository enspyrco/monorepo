import 'package:flutter/material.dart';

class SelectionLabel extends StatelessWidget {
  const SelectionLabel({required this.iconData, Key? key}) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Icon(iconData, color: Colors.grey),
    );
  }
}
