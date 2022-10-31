import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

class HomePageState<T extends AstroState> implements PageState, AstroState {
  const HomePageState();

  @override
  HomePageState<T> copyWith() => this;

  @override
  toJson() => {'type': 'HomePageState'};
}
