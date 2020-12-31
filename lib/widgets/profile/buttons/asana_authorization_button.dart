import 'package:flutter/material.dart';
import 'package:the_process/actions/auth/get_authorized.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/enums/auth/provider.dart';
import 'package:the_process/extensions/flutter_extensions.dart';

class AsanaAuthorizationButton extends StatelessWidget {
  final AuthorizationStep step;

  AsanaAuthorizationButton({required this.step});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: ImageIcon(AssetImage('assets/asana_white.png'),
            color: (step == AuthorizationStep.waitingForInput)
                ? Colors.grey
                : Colors.amberAccent),
        elevation: (step == AuthorizationStep.waitingForInput) ? 1 : 0,
        onPressed: (step == AuthorizationStep.waitingForInput)
            ? () => context.dispatch(GetAuthorized(toAccess: Provider.asana))
            : null);
  }
}
