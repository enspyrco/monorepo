import 'package:astro_auth/astro_auth.dart';
import 'package:flutter/material.dart';

import '../state/app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: const Text('Button'))
            ],
          ),
          const Center(child: Text('Home'))
        ],
      ),
    );
  }
}

class BasicAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BasicAppBar({Key? key}) : super(key: key);

  @override
  State<BasicAppBar> createState() => _BasicAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class _BasicAppBarState extends State<BasicAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              AvatarMenuButton<AppState>(
                options: {MenuOption('Sign Out', SignOut<AppState>())},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
