import 'package:flireator/actions/auth/sign_in_with_apple.dart';
import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:flireator/extensions/flutter/build_context_extensions.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/widgets/auth/waiting_for_flireator/waiting_for_flireator_page.dart';
import 'package:flireator/widgets/dialogs/waiting_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StoreConnector<AppState, SignInStep>(
            distinct: true,
            converter: (store) => store.state.signInStep,
            builder: (context, authStep) {
              switch (authStep) {
                case SignInStep.checking:
                  return WaitingIndicator('Checking Auth State');
                case SignInStep.waitingForInput:
                  return AppleSignInButton(
                    onPressed: () {
                      context.dispatch(SignInWithApple());
                    },
                  );
                case SignInStep.signingInWithApple:
                  return WaitingIndicator('Signing In With Apple');
                case SignInStep.signingInWithFirebase:
                  return WaitingIndicator('Signing in to Firebase');
                case SignInStep.retrievingFlireatorData:
                  return WaitingForFlireatorView();
                default:
                  return Center(
                    child: Text('Auth Step Unkown'),
                  );
              }
            },
          ),
        ],
      )),
    );
  }
}
