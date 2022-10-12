import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

class AuthCheckScreen<S extends AstroState> extends StatelessWidget {
  const AuthCheckScreen({required this.homePageState, super.key});

  final PageState homePageState;

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<S, SignedInState>(transformer: (state) {
      var signedIn = (state as dynamic).user.signedIn as SignedInState;
      return signedIn;
    }, builder: (context, signedInState) {
      switch (signedInState) {
        case SignedInState.checking:
          return ProgressIndicatorWithMessage(message: 'Checking...');
        case SignedInState.notSignedIn:
          locate<MissionControl<S>>().land(PushRoute<S>(SignInPageState()));
          return ProgressIndicatorWithMessage(
              message: 'No credentials found...');
        case SignedInState.signedIn:
          locate<MissionControl<S>>().land(PushRoute<S>(homePageState));
          return ProgressIndicatorWithMessage(message: 'Credentials found...');
        default:
          return CircularProgressIndicator();
      }
    });
  }
}
