import 'package:flutter/material.dart';

import '../auth/auth_gate.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AuthGate());
  }
}
