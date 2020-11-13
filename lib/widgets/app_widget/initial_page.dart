import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/auth/auth_user_data.dart';
import 'package:the_process/widgets/auth/auth_page.dart';
import 'package:the_process/widgets/home/home_page.dart';
import 'package:the_process/widgets/shared/waiting_indicator.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthStep>(
        distinct: true,
        converter: (store) => store.state.authStep,
        builder: (context, authStep) {
          switch (authStep) {
            case AuthStep.checking:
              return WaitingIndicator('Checking where we\'re at...');
            case AuthStep.contactingApple:
              return WaitingIndicator('Contacting Apple...');
            case AuthStep.contactingGoogle:
              return WaitingIndicator('Contacting Google...');
            case AuthStep.signingInWithFirebase:
              return WaitingIndicator('Preparing your Adventure...');
            case AuthStep.waitingForInput:
              return StoreConnector<AppState, AuthUserData>(
                  distinct: true,
                  converter: (store) => store.state.authUserData,
                  builder: (context, userData) =>
                      (userData == null) ? AuthPage() : HomePage());
            default:
              return Container();
          }
        });
  }
}
