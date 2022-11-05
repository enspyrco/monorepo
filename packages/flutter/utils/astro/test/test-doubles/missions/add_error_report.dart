import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

class AddErrorReport<S extends AstroState> extends LandingMission<S> {
  @override
  S landingInstructions(S state) {
    var newState = (state as dynamic).copyWith(
        error: (state as dynamic).error.copyWith(reports: [
      const DefaultErrorReport(message: 'message'),
      ...(state as dynamic).error.reports as List<DefaultErrorReport>
    ]));
    return newState as S;
  }

  @override
  toJson() => {'name_': 'UpdatingLandingMission', 'state_': {}};
}
