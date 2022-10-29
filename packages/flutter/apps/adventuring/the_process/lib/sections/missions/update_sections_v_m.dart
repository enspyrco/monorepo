import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';

class UpdateSectionsVM extends LandingMission<AppState> {
  UpdateSectionsVM({required bool creatingNewSection})
      : _creatingNewSection = creatingNewSection;

  final bool _creatingNewSection;

  @override
  AppState landingInstructions(AppState state) {
    var newSections =
        state.sections.copyWith(creatingNewSection: _creatingNewSection);
    return state.copyWith(sections: newSections);
  }

  @override
  toJson() => {
        'name_': 'UpdateSectionsVM',
        'state_': {'creatingNewSection': _creatingNewSection}
      };
}
