import 'package:astro_types/json_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/foundation.dart';

/// Part of the DefaultNavigationState - includes the stack of PageState objects.
class DefaultNavigationState implements NavigationState, AstroState {
  const DefaultNavigationState({required this.stack});

  @override
  final List<PageState> stack;

  static DefaultNavigationState get initial =>
      const DefaultNavigationState(stack: []);

  @override
  DefaultNavigationState copyWith({List<PageState>? stack}) {
    return DefaultNavigationState(stack: stack ?? this.stack);
  }

  @override
  JsonMap toJson() {
    return {'stack': stack.map((e) => (e as AstroState).toJson()).toList()};
  }

  @override
  bool operator ==(Object other) =>
      other is DefaultNavigationState && listEquals(other.stack, stack);

  @override
  int get hashCode => Object.hashAll(stack);
}
