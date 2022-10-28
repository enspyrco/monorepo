import '../state/sections/navigation_state.dart';

/// A mixin used by app packages to add the required members to their AppState.
mixin DefaultNavigationState {
  abstract final NavigationState navigation;
}
