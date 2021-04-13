import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class OrganisationSelectionDropdown extends StatefulWidget {
  const OrganisationSelectionDropdown({Key? key}) : super(key: key);

  @override
  _OrganisationSelectionDropdownState createState() =>
      _OrganisationSelectionDropdownState();
}

/// This is the private State class that goes with OrganisationSelectionDropdown.
class _OrganisationSelectionDropdownState
    extends State<OrganisationSelectionDropdown> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
