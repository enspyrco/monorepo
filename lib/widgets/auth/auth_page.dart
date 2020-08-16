import 'package:flireator/actions/auth/connect_auth_state_to_store.dart';
import 'package:flireator/actions/auth/sign_in_with_apple.dart';
import 'package:flireator/enums/auth/auth_step.dart';
import 'package:flireator/extensions/flutter/build_context_extensions.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/widgets/dialogs/waiting_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, AuthStep>(
        onInit: (store) => store.dispatch(ConnectAuthStateToStore()),
        distinct: true,
        converter: (store) => store.state.authStep,
        builder: (context, authStep) {
          switch (authStep) {
            case AuthStep.checking:
              return WaitingIndicator('Checking Auth State');
            case AuthStep.signingInWithApple:
              return WaitingIndicator('Signing In With Apple');
            case AuthStep.retrievingStoredToken:
              return WaitingIndicator('Retrieving stored GitHub token');
            case AuthStep.signingInWithGitHub:
              return WaitingIndicator('Signing in to Firebase with GitHub');
            case AuthStep.waitingForInput:
              return AppleSignInButton(
                onPressed: () {
                  context.dispatch(SignInWithApple());
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
