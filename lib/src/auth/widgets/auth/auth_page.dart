import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/src/auth/actions/sign_in_with_apple_action.dart';
import 'package:redfire/src/auth/actions/sign_in_with_google_action.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/src/settings/enums/platform_enum.dart';
import 'package:redfire/src/types/red_fire_state.dart';

import 'auth_page_buttons/apple_sign_in_button.dart';
import 'auth_page_buttons/google_sign_in_button.dart';

class AuthPage<T extends RedFireState> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: StoreConnector<T, PlatformsEnum>(
            distinct: true,
            converter: (store) => store.state.settings.platform,
            builder: (context, platform) {
              return (platform == PlatformsEnum.macOS ||
                      platform == PlatformsEnum.iOS)
                  ? AppleSignInButton(
                      style: AppleButtonStyle.black,
                      onPressed: () =>
                          context.dispatch<T>(SignInWithAppleAction()))
                  : GoogleSignInButton(
                      onPressed: () =>
                          context.dispatch<T>(SignInWithGoogleAction()));
            }));
  }
}
