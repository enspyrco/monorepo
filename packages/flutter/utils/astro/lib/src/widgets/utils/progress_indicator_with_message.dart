import 'package:flutter/material.dart';

/// Just a [CircularProgressIndicator] and a message in a column.
class ProgressIndicatorWithMessage extends StatelessWidget {
  const ProgressIndicatorWithMessage({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CircularProgressIndicator(),
        const SizedBox(height: 30),
        Text(message) // , textDirection: TextDirection.ltr
      ],
    );
  }
}
