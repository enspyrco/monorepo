import 'package:flutter/material.dart';

class ItemsDropdown extends StatefulWidget {
  const ItemsDropdown({Key? key}) : super(key: key);

  @override
  State<ItemsDropdown> createState() => _ItemsDropdownState();
}

class _ItemsDropdownState extends State<ItemsDropdown> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      style: const TextStyle(color: Colors.white, fontSize: 12),
      underline: const SizedBox(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
    );
  }
}
