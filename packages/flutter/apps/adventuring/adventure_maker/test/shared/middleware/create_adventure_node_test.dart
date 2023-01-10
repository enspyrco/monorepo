import 'package:adventure_maker/_app/state/app_state.dart';
import 'package:adventure_maker/shared/missions/create_adventure_node.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:astro_types/auth_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:test/test.dart';

void main() {
  group('CreateAdventureNodeMiddleware', () {
    test('creates the relevant type of AdventureNode for selected node',
        () async {
      // Create test-doubles.
      var mission = const CreateAdventureNode('a node name');
      var state = AppState.initial;
      var signedInAppState = state.copyWith(
          auth: state.auth.copyWith(
              user: UserAuthStateTestDouble(
                  signedIn: SignedInState.signedIn, uid: 'uid')));
      var missionControl = RecordingMissionControl(state: signedInAppState);

      // Provide service test-double with stubbed 'createDocument' function.
      Locator.add<FirestoreService>(StubbedFirestoreService(
          createDocumentReturns: Future.value('a doc id')));

      await mission.flightPlan(missionControl);

      /// At this point we have asked the service to save to the db but there is
      /// not currently anything watching the db that will create state change

      /// The [AdventureNodesDropDown] widget will kickoff a [SelectAdventureNode]
      /// mission - we could land a [SelectAdventureNode] mission but this is
      /// then a different tests.
      ///
      /// So ditching this test for now - the app strogly needs a refactor
      /// anyway as I have made it unnecessarily complex and opaque

      /// TODO: After we refactor and simplify the app come back and resurrect
      /// this test

      // // Verify Adventure was created.
      // expect(state.adventures.selected!.name, 'a node name');

      // // Update state to having a selected Adventure.
      // var adventure = const AdventureModel(id: 'id', name: 'adventure!');
      // missionControl.land(SetAdventureNodeSelection(adventure));

      // await mission.flightPlan(missionControl);

      // // Verify Adventure was created.
      // expect(state.adventures.selected!.name, 'adventure');

      // // Update state to having a selected Challenge.
      // var challenge = const ChallengeModel(id: 'id', name: 'challenge!');
      // missionControl.land(SetAdventureNodeSelection(challenge));

      // await mission.flightPlan(missionControl);

      // expect(state.challenges.selected!.name, 'challenge!');

      // // Update state to having a selected Task.
      // var task = const TaskModel(id: 'id', name: 'task!');
      // missionControl.land(SetAdventureNodeSelection(task));

      // await mission.flightPlan(missionControl);

      // expect(state.tasks.selected!.name, 'task!');
    });
  });
}
