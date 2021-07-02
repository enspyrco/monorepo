import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/src/auth/enums/authentication_enum.dart';
import 'package:redfire/src/auth/models/auth_user_data.dart';
import 'package:redfire/src/shared/widgets/waiting_indicator.dart';
import 'package:redfire/src/types/red_fire_state.dart';

class InitialPage<T extends RedFireState> extends StatelessWidget {
  InitialPage(this._authPage, this._mainPage);
  final Widget _authPage;
  final Widget _mainPage;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<T, AuthenticationEnum>(
        distinct: true,
        converter: (store) => store.state.auth.step,
        builder: (context, authStep) {
          switch (authStep) {
            case AuthenticationEnum.checking:
              return WaitingIndicator('Checking where we\'re at...');
            case AuthenticationEnum.contactingApple:
              return WaitingIndicator('Contacting Apple...');
            case AuthenticationEnum.contactingGoogle:
              return WaitingIndicator('Contacting Google...');
            case AuthenticationEnum.signingInWithFirebase:
              return WaitingIndicator('Preparing your Adventure...');
            case AuthenticationEnum.waitingForInput:
              return StoreConnector<T, AuthUserData?>(
                  distinct: true,
                  converter: (store) => store.state.auth.userData,
                  builder: (context, userData) =>
                      (userData == null) ? _authPage : _mainPage);
            case AuthenticationEnum.signingOut:
              return WaitingIndicator('Signing Out...');
          }
        });
  }
}
