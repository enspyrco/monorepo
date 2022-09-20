import 'package:flutter/material.dart';
import 'package:redaux/redaux.dart';
import 'package:redaux_widgets/redaux_widget.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as plugin;

import '../state-management/sign_in_with_apple.dart';
import '../state/user_state.dart';

class SignInScreen<T extends RootState> extends StatelessWidget {
  const SignInScreen(this.signedIn, this.platform, {Key? key})
      : super(key: key);

  final TargetPlatform platform;
  final SignedInState signedIn;

  @override
  Widget build(BuildContext context) {
    if (signedIn == SignedInState.notSignedIn) {
      return plugin.SignInWithAppleButton(
          onPressed: () =>
              StoreProvider.of<T>(context).launch(SignInWithApple<T>()));
    }
    return const CircularProgressIndicator();
  }
}
