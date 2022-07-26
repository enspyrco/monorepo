import 'package:flutter/material.dart';
import 'package:gather_link_accounts/auth/buttons/google_sign_in_button.dart';

import '../state/signed_in_state.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen(this.signedIn, {Key? key}) : super(key: key);

  final SignedInState signedIn;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var enabled = true;
  var explanation =
      'In order to link your Gather account with other accounts such as GitHub,'
      ' we create a section in a database that only this Google account can access.\n\n'
      'Just remember, if you want to unlink accounts or make other changes later'
      ' you’ll need to sign in with the same google account.\n\n'
      'Only public information is stored and can easily be removed on request.';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 400,
      child: Column(
        children: [
          const SizedBox(height: 100),
          if (widget.signedIn == SignedInState.checking ||
              widget.signedIn == SignedInState.signingIn)
            const CircularProgressIndicator()
          else
            const GoogleSignInButton(),
          const SizedBox(height: 50),
          Text(explanation),
          const SizedBox(height: 50),
        ],
      ),
    ));
  }
}
