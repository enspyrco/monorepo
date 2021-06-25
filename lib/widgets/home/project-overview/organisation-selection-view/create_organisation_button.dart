import 'package:flutter/material.dart';

class CreateOrganisationButton extends StatelessWidget {
  const CreateOrganisationButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const IconButton(
      onPressed: null,
      icon: Icon(Icons.add, color: Colors.deepPurple),
    );
  }
}
