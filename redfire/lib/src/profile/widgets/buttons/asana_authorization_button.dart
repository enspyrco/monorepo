import 'package:flutter/material.dart';
import 'package:redfire/src/auth/actions/get_authorized_action.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/types.dart';

class AsanaAuthorizationButton extends StatelessWidget {
  final AuthorizationEnum step;

  const AsanaAuthorizationButton({required this.step, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: (step == AuthorizationEnum.waitingForInput) ? 1 : 0,
      onPressed: (step == AuthorizationEnum.waitingForInput)
          ? () => context
              .dispatch(GetAuthorizedAction(provider: ProvidersEnum.asana))
          : null,
      child: ImageIcon(const AssetImage('assets/asana_white.png'),
          color: (step == AuthorizationEnum.waitingForInput)
              ? Colors.grey
              : Colors.amberAccent),
    );
  }
}
