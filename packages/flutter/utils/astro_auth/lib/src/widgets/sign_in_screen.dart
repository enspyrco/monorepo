import 'package:astro/astro.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as plugin;

import '../missions/sign_in_with_apple.dart';
import '../state/user_state.dart';

class SignInScreen<T extends AstroState> extends StatelessWidget {
  const SignInScreen(this.signedIn, this.platform, {Key? key})
      : super(key: key);

  final TargetPlatform platform;
  final SignedInState signedIn;

  @override
  Widget build(BuildContext context) {
    if (signedIn == SignedInState.notSignedIn) {
      return plugin.SignInWithAppleButton(
          onPressed: () => MissionControlProvider.of<T>(context)
              .launch(SignInWithApple<T>()));
    }
    return const CircularProgressIndicator();
  }
}
