import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:flutter/material.dart';

import 'app/state/app_state.dart';

/// An [OnStateChangeBuilder] that updates the [Navigator] whenever [AppState.pages]
/// changes.
class PagesNavigator extends StatelessWidget {
  const PagesNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<AppState, List<PageState>>(
      onInit: (missionControl) =>
          missionControl.launch(BindAuthState<AppState>()),
      transformer: (state) => state.navigation.stack,
      builder: (context, stack) => Navigator(
        pages: [
          for (var pageState in stack)
            locate<PageGenerator>().applyTo(pageState)
        ],
        onPopPage: (route, dynamic result) {
          if (!route.didPop(result)) {
            return false;
          }

          if (route.isCurrent) {
            locate<MissionControl<AppState>>().land(RemoveCurrentRoute());
          }

          return true;
        },
      ),
    );
  }
}
