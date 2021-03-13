import 'package:flutter/material.dart';

class ConfirmationAlert extends StatelessWidget {
  final String _question;

  ConfirmationAlert({required String question}) : _question = question;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Just checking!'),
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
          child: Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop<bool>(false);
          },
          child: Text('No'),
        ),
      ],
    );
  }
}
