import 'package:flutter/material.dart';
import 'package:the_process/actions/auth/get_authorized_action.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/enums/auth/provider_name.dart';
import 'package:the_process/extensions/flutter_extensions.dart';

class AsanaAuthorizationButton extends StatelessWidget {
  final AuthorizationStep step;

  const AsanaAuthorizationButton({required this.step, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: (step == AuthorizationStep.waitingForInput) ? 1 : 0,
      onPressed: (step == AuthorizationStep.waitingForInput)
          ? () => context
              .dispatch(GetAuthorizedAction(provider: ProviderName.asana))
          : null,
      child: ImageIcon(const AssetImage('assets/asana_white.png'),
          color: (step == AuthorizationStep.waitingForInput)
              ? Colors.grey
              : Colors.amberAccent),
    );
  }
}
