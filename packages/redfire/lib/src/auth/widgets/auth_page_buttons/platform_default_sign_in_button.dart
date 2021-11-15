import 'package:flutter/material.dart';
import 'package:redfire/src/auth/actions/sign_in_with_apple_action.dart';
import 'package:redfire/src/auth/actions/sign_in_with_google_action.dart';
import 'package:redfire/src/auth/widgets/auth_page_buttons/apple_sign_in_button.dart';
import 'package:redfire/src/auth/widgets/auth_page_buttons/google_sign_in_button.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/src/settings/enums/platform_enum.dart';
import 'package:redfire/src/types/red_fire_state.dart';

class PlatformDefaultSignInButton<T extends RedFireState>
    extends StatelessWidget {
  const PlatformDefaultSignInButton(this.platform, {Key? key})
      : super(key: key);

  final PlatformsEnum platform;

  @override
  Widget build(BuildContext context) {
    return (platform == PlatformsEnum.macOS || platform == PlatformsEnum.iOS)
        ? AppleSignInButton(
            style: AppleButtonStyle.black,
            onPressed: () => context.dispatch<T>(const SignInWithAppleAction()))
        : GoogleSignInButton(
            onPressed: () =>
                context.dispatch<T>(const SignInWithGoogleAction()));
  }
}
