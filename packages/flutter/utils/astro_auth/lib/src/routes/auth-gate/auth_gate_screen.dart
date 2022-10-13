import 'package:astro/astro.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import '../../state/user_state.dart';
import '../sign-in/sign_in_screen.dart';

class AuthGateScreen<S extends AstroState> extends StatelessWidget {
  const AuthGateScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<S, SignedInState>(
      transformer: (state) => (state as dynamic).auth.user.signedIn,
      builder: ((context, signedInState) {
        switch (signedInState) {
          case SignedInState.checking:
            return ProgressIndicatorWithMessage(message: 'Checking...');
          case SignedInState.notSignedIn:
            return SignInScreen<S>();
          case SignedInState.signedIn:
            return child;
          default:
            return CircularProgressIndicator();
        }
      }),
    );
  }
}
