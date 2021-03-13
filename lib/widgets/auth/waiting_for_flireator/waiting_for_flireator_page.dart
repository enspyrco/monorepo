import 'package:flireator/widgets/auth/waiting_for_flireator/initial_config_form.dart';
import 'package:flireator/widgets/dialogs/waiting_indicator.dart';
import 'package:flutter/material.dart';

class WaitingForFlireatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      WaitingIndicator('Retrieving your data from the Firestore'),
      InitialConfigForm()
    ]);
  }
}
