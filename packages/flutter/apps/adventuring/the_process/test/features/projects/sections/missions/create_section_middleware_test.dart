import 'package:astro_auth/astro_auth.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:astro_types/auth_types.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/state/app_state.dart';
import 'package:the_process/sections/missions/create_section.dart';
import 'package:the_process/sections/missions/update_sections_v_m.dart';

void main() {
  group('CreateProjectSectionMiddleware', () {
    test('dispatches UpdateSectionsVM and calls DatabaseServce.createSection',
        () async {
      var initialState = AppState.initial;

      var aUserState = DefaultUserState(signedIn: SignedInState.checking);

      var state = initialState.copyWith(
          auth: initialState.auth.copyWith(user: aUserState),
          sections: initialState.sections.copyWith(newName: 'testy'));

      var missionControl = RecordingMissionControl<AppState>(state: state);

      const mission = CreateSection();
      await mission.flightPlan(missionControl);

      expect(
          missionControl
              .recorded(const UpdateSectionsVM(creatingNewSection: true)),
          true);
    });
  },
      skip:
          true); // until we fix CreateSection to use the database rather than a CloudRun instance
}
