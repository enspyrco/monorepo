import 'package:flutter/material.dart';
import 'package:redaux_widgets/redaux_widget.dart';

import '../app/state/app_state.dart';
import '../auth/state_management/sign_out.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Home Screen'),
      onPressed: () {
        StoreProvider.of<AppState>(context).dispatch(SignOut());
      },
    );
  }
}
