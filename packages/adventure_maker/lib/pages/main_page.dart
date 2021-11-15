import 'package:adventure_maker/main.dart';
import 'package:flutter/material.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () => context.dispatch<AppState>(const SignOutAction()),
      child: const Text('Sign Out'),
    ));
  }
}
