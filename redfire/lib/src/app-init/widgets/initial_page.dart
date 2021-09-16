import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/src/auth/enums/auth_step_enum.dart';
import 'package:redfire/src/auth/models/auth_user_data.dart';
import 'package:redfire/src/shared/widgets/waiting_indicator.dart';
import 'package:redfire/src/types/red_fire_state.dart';

class InitialPage<T extends RedFireState> extends StatelessWidget {
  const InitialPage(this._authPage, this._mainPage, {Key? key})
      : super(key: key);
  final Widget _authPage;
  final Widget _mainPage;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<T, AuthStepEnum>(
        distinct: true,
        converter: (store) => store.state.auth.step,
        builder: (context, authStep) {
          switch (authStep) {
            case AuthStepEnum.checking:
              return const WaitingIndicator('Checking where we\'re at...');
            case AuthStepEnum.contactingApple:
              return const WaitingIndicator('Contacting Apple...');
            case AuthStepEnum.contactingGoogle:
              return const WaitingIndicator('Contacting Google...');
            case AuthStepEnum.signingInWithFirebase:
              return const WaitingIndicator('Preparing your Adventure...');
            case AuthStepEnum.waitingForInput:
              return StoreConnector<T, AuthUserData?>(
                  distinct: true,
                  converter: (store) => store.state.auth.userData,
                  builder: (context, userData) =>
                      (userData == null) ? _authPage : _mainPage);
            case AuthStepEnum.signingOut:
              return const WaitingIndicator('Signing Out...');
          }
        });
  }
}
