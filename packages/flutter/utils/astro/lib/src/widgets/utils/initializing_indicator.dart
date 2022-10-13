import 'package:flutter/material.dart';

/// This widget is just a [CircularProgressIndicator] and some text, in a
/// [Material] widget so it can be used during initialization, before we're
/// under the [MaterialApp].
class InitializingIndicator extends StatelessWidget {
  final bool _firebaseDone;
  const InitializingIndicator(this._firebaseDone, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var message = '';
    if (!_firebaseDone) {
      message = 'Firing up the machine, taking care to not cross streams...';
    }
    return Material(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            const SizedBox(height: 30),
            Text(message, textDirection: TextDirection.ltr)
          ]),
    );
  }
}
