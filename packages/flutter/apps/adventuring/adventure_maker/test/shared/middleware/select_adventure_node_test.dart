import 'package:adventure_maker/_app/state/app_state.dart';
import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/shared/missions/select_adventure_node.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:astro_types/auth_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:test/test.dart';

void main() {
  group('SelectAdventureNodeMiddleware', () {
    test('retrieves children for the selected node', () async {
      // Create test-doubles.
      var selection = const AdventureModel(name: 'a node name');
      var mission = SelectAdventureNode(selection);
      var state = AppState.initial;
      var signedInAppState = state.copyWith(
          auth: state.auth.copyWith(
              user: UserAuthStateTestDouble(signedIn: SignedInState.signedIn)));
      var missionControl = RecordingMissionControl(state: signedInAppState);

      // Provide stubbed service test-double.
      final service = StubbedFirestoreService(
          getDocumentsReturns: Future.value([
        Document(
            id: 'id', path: '/', fields: <String, dynamic>{'name': 'aName'})
      ]));
      Locator.add<FirestoreService>(service, overwrite: true);

      await mission.flightPlan(missionControl);

      /// TODO verify state change
      /// TODO: Come back and resurrect this test after a well needed refactor
    });
  });
}
