import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

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
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            descriptionText,
            style: const TextStyle(fontSize: 20),
          ),
        ),
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
      var doc = loadYaml(pubspecString);
      print(doc['dependencies']);
    }
  }
}
