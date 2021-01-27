import 'package:flutter/material.dart';
import 'package:the_process/actions/auth/get_authorized.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/enums/auth/provider_name.dart';
import 'package:the_process/extensions/flutter_extensions.dart';

class GoogleAuthorizationButton extends StatelessWidget {
  final AuthorizationStep step;

  GoogleAuthorizationButton({required this.step});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: ImageIcon(AssetImage('assets/google.png'),
            color: (step == AuthorizationStep.waitingForInput)
                ? Colors.grey
                : Colors.amberAccent),
        elevation: (step == AuthorizationStep.waitingForInput) ? 1 : 0,
        onPressed: (step == AuthorizationStep.waitingForInput)
            ? () =>
                context.dispatch(GetAuthorized(provider: ProviderName.google))
            : null);
  }
}
