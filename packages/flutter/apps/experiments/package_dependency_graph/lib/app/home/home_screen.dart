import 'dart:io';

import 'package:astro_auth/astro_auth.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../state/app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(),
      body: Text('Home Screen'),
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
            children: <Widget>[
              OutlinedButton(
                onPressed: () => showPicker(),
                style: OutlinedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                    side: const BorderSide(width: 2.0, color: Colors.black),
                    backgroundColor: Colors.amberAccent),
                child: const Text(
                  'Select Package',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const Spacer(),
              const AvatarMenuButton<AppState>(
                options: {
                  MenuOption('Sign Out', SignOut<AppState>()),
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showPicker() async {
    const typeGroup = XTypeGroup(
      label: 'yaml',
      extensions: ['yml', 'yaml'],
    );

    final XFile? xFile = await openFile(acceptedTypeGroups: [typeGroup]);
    if (xFile != null) {
      var last = (p.split(xFile.path)..removeLast()).last;
      var pubspecString = File(xFile.path).readAsStringSync();
      print(pubspecString);
    }
  }
}
