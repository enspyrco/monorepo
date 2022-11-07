/// A mixin used by app packages to add the required members to their AppState.
abstract class AppStateNavigation {
  abstract final NavigationState navigation;
}

class NavigationState {
  const NavigationState({required this.stack});

  final List<PageState> stack;
}

abstract class PageState {}
