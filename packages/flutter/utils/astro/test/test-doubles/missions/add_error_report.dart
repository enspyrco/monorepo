import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

class AddErrorReport<S extends AstroState> extends LandingMission<S> {
  @override
  S landingInstructions(S state) {
    return (state as dynamic).copyWith(reports: [
      ErrorReport(message: 'message'),
      ...(state as dynamic).reports as List<ErrorReport>
    ]) as S;
  }

  @override
  toJson() => {
        'name_': 'UpdatingLandingMission',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parent?.hashCode
      };
}
