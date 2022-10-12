import 'package:astro_auth/astro_auth.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:flutter/material.dart';

import '../app/state/app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Home Screen'),
      onPressed: () {
        locate<MissionControl<AppState>>().launch(SignOut<AppState>());
      },
    );
  }
}
