import 'package:flutter/material.dart';
import 'package:redfire/src/auth/actions/get_authorized_action.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/types.dart';

class GoogleAuthorizationButton extends StatelessWidget {
  final AuthorizationEnum step;

  const GoogleAuthorizationButton({required this.step, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: (step == AuthorizationEnum.waitingForInput) ? 1 : 0,
      onPressed: (step == AuthorizationEnum.waitingForInput)
          ? () => context.dispatch(
              const GetAuthorizedAction(provider: ProvidersEnum.google))
          : null,
      child: ImageIcon(const AssetImage('assets/google.png'),
          color: (step == AuthorizationEnum.waitingForInput)
              ? Colors.grey
              : Colors.amberAccent),
    );
  }
}
