import 'package:astro_auth/astro_auth.dart';
import 'package:astro_widgets/astro_widget.dart';
import 'package:flutter/material.dart';

import '../app/state/app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Home Screen'),
      onPressed: () {
        MissionControlProvider.of<AppState>(context)
            .launch(SignOut<AppState>());
      },
    );
  }
}
