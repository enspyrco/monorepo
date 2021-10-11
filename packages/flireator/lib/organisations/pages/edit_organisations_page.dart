import 'package:flireator/main.dart';
import 'package:flutter/material.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';

class EditOrganisationsPage extends StatelessWidget {
  const EditOrganisationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OutlinedButton(
        onPressed: () => context.dispatch<AppState>(RemoveCurrentPageAction()),
        child: const Text('Dismiss'),
      ),
    );
  }
}
