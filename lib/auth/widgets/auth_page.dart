import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/app_state.dart';
import 'package:redfire/auth/actions/sign_in_with_apple_action.dart';
import 'package:redfire/auth/actions/sign_in_with_google_action.dart';
import 'package:redfire/settings/enums/platform_enum.dart';
import 'package:redfire/utils/build_context_extensions.dart';

import 'auth_page_buttons/apple_sign_in_button.dart';
import 'auth_page_buttons/google_sign_in_button.dart';

class AuthPage<T extends RedFireState> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: StoreConnector<T, PlatformEnum>(
            distinct: true,
            converter: (store) => store.state.settings.platform,
            builder: (context, platform) {
              return (platform == PlatformEnum.macOS ||
                      platform == PlatformEnum.iOS)
                  ? AppleSignInButton(
                      style: AppleButtonStyle.black,
                      onPressed: () =>
                          context.dispatch(SignInWithAppleAction()))
                  : GoogleSignInButton(
                      onPressed: () =>
                          context.dispatch(SignInWithGoogleAction()));
            }));
  }
}
