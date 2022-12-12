import 'package:flutter/material.dart';
import 'package:package_dependency_graph/shared/extensions/build_context_extensions.dart';

import '../../state/dependency.dart';
import '../missions/select_packages.dart';

class SelectPackagesArea extends StatefulWidget {
  const SelectPackagesArea({required this.dependencies, super.key});

  final List<Dependency> dependencies;

  @override
  State<SelectPackagesArea> createState() => _SelectPackagesAreaState();
}

class _SelectPackagesAreaState extends State<SelectPackagesArea> {
  String buttonText = 'Select Packages';
  String descriptionText = '';
  Color buttonBackground = Colors.amberAccent;
  Color buttonForeground = Colors.black;

  /// Set button state based on whether we have selected dependencies or not
  // setState(() {
  //   descriptionText = (p.split(xFile.path)..removeLast()).last;
  //   buttonText = 'edit';
  //   buttonBackground = Colors.white;
  //   buttonForeground = Colors.grey;
  // });

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
          onPressed: () => context.launch(const SelectPackages()),
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
}
