import 'package:flutter/material.dart';

class SelectionContainer extends StatelessWidget {
  const SelectionContainer({required this.widgets});

  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        height: 40,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widgets));
  }
}
