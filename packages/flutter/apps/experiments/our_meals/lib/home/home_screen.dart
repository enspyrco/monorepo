import 'package:flutter/material.dart';
import 'package:redaux_auth/redaux_auth.dart';
import 'package:redaux_widgets/redaux_widget.dart';

import '../app/state/app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Home Screen'),
      onPressed: () {
        StoreProvider.of<AppState>(context).launch(SignOut<AppState>());
      },
    );
  }
}
