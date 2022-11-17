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
            children: const <Widget>[
              SelectPackagesArea(),
              Spacer(),
              AvatarMenuButton<AppState>(
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
}

class SelectPackagesArea extends StatefulWidget {
  const SelectPackagesArea({super.key});

  @override
  State<SelectPackagesArea> createState() => _SelectPackagesAreaState();
}

class _SelectPackagesAreaState extends State<SelectPackagesArea> {
  String buttonText = 'Select Packages';
  String descriptionText = '';
  Color buttonBackground = Colors.amberAccent;
  Color buttonForeground = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(descriptionText),
        const SizedBox(width: 50),
        OutlinedButton(
          onPressed: () => showPicker(),
          style: OutlinedButton.styleFrom(
              textStyle: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
              side: BorderSide(width: 2.0, color: buttonForeground),
              backgroundColor: buttonBackground),
          child: Text(
            buttonText,
            style: TextStyle(color: buttonForeground),
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
      setState(() {
        descriptionText = (p.split(xFile.path)..removeLast()).last;
        buttonText = 'edit';
        buttonBackground = Colors.white;
        buttonForeground = Colors.grey;
      });
      var pubspecString = File(xFile.path).readAsStringSync();
      print(pubspecString);
    }
  }
}
