import 'package:flireator/main.dart';
import 'package:flutter/material.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';

class CreateOrganisationPage extends StatelessWidget {
  const CreateOrganisationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Woop!'),
      content: const SingleChildScrollView(child: Text('Some more text')),
      actions: [
        OutlinedButton(
            onPressed: () =>
                context.dispatch<AppState>(RemoveCurrentPageAction()),
            child: const Text('Dismiss'))
      ],
    );
  }
}
