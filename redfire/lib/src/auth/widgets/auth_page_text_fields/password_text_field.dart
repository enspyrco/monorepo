import 'package:flutter/material.dart';
import 'package:redfire/src/auth/actions/email/sign_in_with_email_action.dart';
import 'package:redfire/src/auth/actions/email/sign_up_with_email_action.dart';
import 'package:redfire/src/auth/enums/email_sign_in_step_enum.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/src/types/red_fire_state.dart';

class PasswordTextField<T extends RedFireState> extends StatelessWidget {
  const PasswordTextField({
    required EmailSignInStepEnum step,
    Key? key,
  })  : _step = step,
        super(key: key);

  final EmailSignInStepEnum _step;

  @override
  Widget build(BuildContext context) {
    var _hintText = (_step == EmailSignInStepEnum.waitingForSignUpPassword)
        ? 'enter password to create a new account'
        : 'enter password to sign in';
    return Material(
      child: TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
        obscureText: true,
        autofocus: true,
        decoration: InputDecoration.collapsed(
            hintText: _hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            fillColor: Colors.grey[900],
            filled: true),
        onSubmitted: (password) =>
            (_step == EmailSignInStepEnum.waitingForSignUpPassword)
                ? context.dispatch<T>(SignUpWithEmailAction(password))
                : context.dispatch<T>(SignInWithEmailAction(password)),
      ),
    );
  }
}
