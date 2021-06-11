import 'package:flutter/material.dart';

/// This widget is just a CircularProgressIndicator and some text, in a
/// Material widget so it looks nice, as it is used outside of the MaterialApp.
///
/// It's a separate widget as the existing ProgressIndicator widget doesn't
/// need to have it's contents in a Material widget.
class InitializingIndicator extends StatelessWidget {
  final bool _firebaseDone;
  final bool _reduxDone;
  const InitializingIndicator(this._firebaseDone, this._reduxDone);

  @override
  Widget build(BuildContext context) {
    var message = '';
    if (!_firebaseDone) {
      message = 'Firing up the machine...';
    } else if (!_reduxDone) {
      message = 'Taking care to not cross streams...';
    }
    return Material(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 30),
            Text(message, textDirection: TextDirection.ltr)
          ]),
    );
  }
}
