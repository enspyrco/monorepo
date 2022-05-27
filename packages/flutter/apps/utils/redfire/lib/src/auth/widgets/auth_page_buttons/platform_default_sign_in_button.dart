import 'package:flutter/material.dart';

import '../../../redux/extensions/build_context_extensions.dart';
import '../../../settings/enums/platform_enum.dart';
import '../../../types/red_fire_state.dart';
import '../../actions/sign_in_with_apple_action.dart';
import '../../actions/sign_in_with_google_action.dart';
import 'apple_sign_in_button.dart';
import 'google_sign_in_button.dart';

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
