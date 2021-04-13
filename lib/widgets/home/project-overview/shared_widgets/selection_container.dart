import 'package:flutter/material.dart';

class SelectionContainer extends StatelessWidget {
  const SelectionContainer({required this.widgets});

  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        height: 40,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widgets));
  }
}
