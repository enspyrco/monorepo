import 'package:astro/astro.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as plugin;

import '../../missions/sign_in_with_apple.dart';

class SignInScreen<T extends AstroState> extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<T, SignedInState>(
        transformer: (state) => (state as dynamic).auth.user.signedIn,
        builder: (context, signedInState) {
          if (signedInState == SignedInState.notSignedIn) {
            return plugin.SignInWithAppleButton(
                onPressed: () =>
                    locate<MissionControl<T>>().launch(SignInWithApple<T>()));
          }
          return const CircularProgressIndicator();
        });
  }
}
