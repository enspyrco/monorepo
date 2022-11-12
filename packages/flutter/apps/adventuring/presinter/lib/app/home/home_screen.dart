import 'package:astro_auth/astro_auth.dart';
import 'package:flutter/material.dart';

import '../state/app_state.dart';
import 'role_selector.dart';
import 'sessions_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: const [
            AvatarMenuButton<AppState>(
              options: {
                MenuOption('Sign Out', SignOut()),
              },
            )
          ],
        ),
        body: Center(
          child: Row(children: const [RoleSelector(), SessionsView()]),
        ));
  }
}
