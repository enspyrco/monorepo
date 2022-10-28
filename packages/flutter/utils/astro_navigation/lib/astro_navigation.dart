library astro_navigation;

import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

export 'src/missions/push_route.dart';
export 'src/missions/remove_current_route.dart';
export 'src/transitions/easy_tween_slide_transition.dart';
export 'src/widgets/pages_navigator.dart';

/// A mixin used by app packages to add the required members to their AppState.
mixin DefaultNavigationState {
  abstract final NavigationState navigation;
}

/// Part of the DefaultNavigationState - includes the stack of PageState objects.
class NavigationState extends AstroState {
  NavigationState({required this.stack});

  final List<PageState> stack;

  static get initial => NavigationState(stack: const []);

  @override
  NavigationState copyWith({List<PageState>? stack}) {
    return NavigationState(stack: stack ?? this.stack);
  }

  @override
  JsonMap toJson() {
    return {'stack': stack.map((e) => (e as AstroState).toJson()).toList()};
  }

  @override
  bool operator ==(Object other) =>
      other is NavigationState && listEquals(other.stack, stack);

  @override
  int get hashCode => Object.hashAll(stack);
}

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
