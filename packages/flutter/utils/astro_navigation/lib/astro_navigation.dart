library astro_navigation;

import 'package:astro_types/navigation_types.dart';
import 'package:flutter/material.dart';

export 'src/interfaces/default_navigation_state.dart';
export 'src/missions/push_route.dart';
export 'src/missions/remove_current_route.dart';
export 'src/state/sections/navigation_state.dart';
export 'src/transitions/basic_tween_slide_transition.dart';
export 'src/widgets/pages_navigator.dart';

/// Holds a map of {type : generator function}
/// The generator functions take a page state and return a page.
/// A [PageGenerator] is used with a [Locator] to allow the [AstroBase]
/// widget to turn [AppState.navigator.stack] into a [List<MaterialPage>] to
/// pass into the navigator.
class PageGenerator {
  PageGenerator(Map<Type, MaterialPage Function(PageState)>? map)
      : _map = map ?? {};

  final Map<Type, MaterialPage Function(PageState)> _map;

  void add(
          {required Type type,
          required MaterialPage Function(PageState) generator}) =>
      _map[type] = generator;

  MaterialPage applyTo(PageState state) => _map[state.runtimeType]!(state);
}
