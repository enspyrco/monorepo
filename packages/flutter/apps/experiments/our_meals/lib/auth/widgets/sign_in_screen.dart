import 'package:flutter/material.dart';
import 'package:our_meals/auth/state/user_state.dart';
import 'package:redaux_widgets/redaux_widget.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as plugin;

import '../../app_state.dart';
import '../state_management/sign_in_with_apple.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen(this.signedIn, this.platform, {Key? key})
      : super(key: key);

  final TargetPlatform platform;
  final SignedInState signedIn;

  @override
  Widget build(BuildContext context) {
    if (signedIn == SignedInState.notSignedIn) {
      return plugin.SignInWithAppleButton(
          onPressed: () =>
              StoreProvider.of<AppState>(context).dispatch(SignInWithApple()));
    }
    return const CircularProgressIndicator();
  }
}
