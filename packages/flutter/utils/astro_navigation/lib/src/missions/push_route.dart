import 'package:astro_types/core_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

class PushRoute<S extends AstroState> extends LandingMission<S> {
  PushRoute(this.pageState);

  final PageState pageState;

  @override
  S landingInstructions(S state) {
    var newState = (state as dynamic).copyWith(
        navigation: (state as dynamic).navigation.copyWith(stack: [
      pageState,
      ...(state as dynamic).navigation.stack as List<PageState>
    ])) as S;
    return newState;
  }

  @override
  toJson() => {
        'name_': 'PushRoute',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parent?.hashCode,
        'state_': {'pageState': (pageState as AstroState).toJson()}
      };
}
