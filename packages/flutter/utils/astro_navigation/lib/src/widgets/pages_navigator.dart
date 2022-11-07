import 'package:astro/astro.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import '../../astro_navigation.dart';

/// An [OnStateChangeBuilder] that updates the [Navigator] whenever [AppState.pages]
/// changes.
class PagesNavigator<S extends AstroState> extends StatelessWidget {
  const PagesNavigator({this.onInit, Key? key}) : super(key: key);

  final void Function(MissionControl<S>)? onInit;

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<S, List<PageState>>(
        onInit: onInit,
        transformer: (state) => (state as AppStateNavigation).navigation.stack,
        builder: (context, stack) {
          var generator = locate<PageGenerator>();
          return Navigator(
              pages: [
                for (var pageState in stack.reversed)
                  generator.applyTo(pageState)
              ],
              onPopPage: (route, dynamic result) {
                if (!route.didPop(result)) {
                  return false;
                }

                if (route.isCurrent) {
                  locate<MissionControl<S>>().land(const RemoveCurrentRoute());
                }

                return true;
              });
        });
  }
}
