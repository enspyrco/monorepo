import 'package:astro_types/json_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/foundation.dart';

/// Part of the DefaultNavigationState - includes the stack of PageState objects.
class NavigationState extends AstroState {
  const NavigationState({required this.stack});

  final List<PageState> stack;

  static NavigationState get initial => const NavigationState(stack: []);

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
