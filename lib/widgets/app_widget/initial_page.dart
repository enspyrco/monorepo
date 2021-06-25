import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/enums/auth/auth_step_enum.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/auth/auth_user_data.dart';
import 'package:the_process/widgets/auth/auth_page.dart';
import 'package:the_process/widgets/home/home_page.dart';
import 'package:the_process/widgets/shared/waiting_indicator.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthStepEnum>(
        distinct: true,
        converter: (store) => store.state.authStep,
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
              return StoreConnector<AppState, AuthUserData?>(
                  distinct: true,
                  converter: (store) => store.state.authUserData,
                  builder: (context, userData) =>
                      (userData == null) ? const AuthPage() : const HomePage());
            default:
              return Container();
          }
        });
  }
}
