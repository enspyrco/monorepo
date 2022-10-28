import 'package:astro_types/core_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../state/sections/navigation_state.dart';

class PushRoute<S extends AstroState> extends LandingMission<S> {
  PushRoute(this.pageState);

  final PageState pageState;

  @override
  S landingInstructions(S state) {
    NavigationState navigation = (state as dynamic).navigation;
    var newNavigation =
        navigation.copyWith(stack: [pageState, ...navigation.stack]);
    return (state as dynamic).copyWith(navigation: newNavigation) as S;
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
