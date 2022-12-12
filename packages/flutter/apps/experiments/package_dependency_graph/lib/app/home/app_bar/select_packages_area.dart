import 'package:flutter/material.dart';
import 'package:package_dependency_graph/shared/extensions/build_context_extensions.dart';

import '../../../package_selection/missions/select_packages.dart';
import '../../../shared/models/package.dart';

class SelectPackagesArea extends StatefulWidget {
  const SelectPackagesArea({required this.packages, super.key});

  final Set<Package> packages;

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
    // if we have selected a package, change the UI
    if (widget.packages.isNotEmpty) {
      descriptionText = widget.packages.first.name;
      buttonText = 'edit';
      buttonBackground = Colors.white;
      buttonForeground = Colors.grey;
    }

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
