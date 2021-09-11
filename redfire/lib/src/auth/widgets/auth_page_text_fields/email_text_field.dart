import 'package:flutter/material.dart';
import 'package:redfire/src/auth/actions/email/check_sign_in_methods_for_email_action.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/src/types/red_fire_state.dart';

class EmailTextField<T extends RedFireState> extends StatelessWidget {
  const EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration.collapsed(
            hintText: 'enter email',
            hintStyle: const TextStyle(color: Colors.grey),
            fillColor: Colors.grey[900],
            filled: true),
        onSubmitted: (email) =>
            context.dispatch<T>(CheckSignInMethodsForEmailAction(email)),
      ),
    );
  }
}
