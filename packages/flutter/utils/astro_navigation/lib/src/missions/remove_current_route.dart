import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

class RemoveCurrentRoute<S extends AstroState> extends LandingMission<S> {
  @override
  S landingInstructions(S state) => (state as dynamic).copyWith(
      pages: [...((state as dynamic).navigation.stack)]..removeAt(0)) as S;

  @override
  toJson() => {
        'name_': 'RemoveCurrentRoute',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parent?.hashCode
      };
}
