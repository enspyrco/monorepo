import 'package:flutter/material.dart';

class ConfirmationAlert extends StatelessWidget {
  final String _question;

  const ConfirmationAlert({required String question, Key? key})
      : _question = question,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Just checking!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(_question),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop<bool>(true);
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop<bool>(false);
          },
          child: const Text('No'),
        ),
      ],
    );
  }
}
