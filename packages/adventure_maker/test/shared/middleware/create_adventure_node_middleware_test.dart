import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/shared/actions/create_adventure_node_action.dart';
import 'package:adventure_maker/shared/middleware/create_adventure_node_middleware.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/services.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('CreateAdventureNodeMiddleware', () {
    test('catches errors and dispatches AddProblemAction', () {
      // Create test-doubles.
      var nodeName = 'a node name';
      var action = CreateAdventureNodeAction(nodeName);
      var exampleAuthUser = AuthUserDataExample.minimal;
      var signedInAppState =
          AppState.init().copyWith.auth(userData: exampleAuthUser);
      var store = FakeStore(signedInAppState);
      var mockService = MockDatabaseService();

      // Stub test-doubles.
      when(mockService.createDocument(
              at: anyNamed('at'), from: anyNamed('from')))
          .thenThrow('error');

      // Provide test-doubles.
      RedFireLocator.provide(databaseService: mockService);

      var middleware = CreateAdventureNodeMiddleware();

      // Call the middleware.
      middleware.call(store, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(store.dispatched.last is AddProblemAction, true);
    });

    test('creates the relevant type of AdventureNode for selected node', () {
      // Create test-doubles.
      var action = const CreateAdventureNodeAction('a node name');
      var exampleAuthUser = AuthUserDataExample.minimal;
      var signedInAppState =
          AppState.init().copyWith.auth(userData: exampleAuthUser);
      var store = FakeStore(signedInAppState);
      var mockService = MockDatabaseService();

      // Stub test-doubles.
      when(mockService.createDocument(
              at: anyNamed('at'), from: anyNamed('from')))
          .thenAnswer((_) => Future.value('a doc id'));

      // Provide test-doubles.
      RedFireLocator.provide(databaseService: mockService);

      var middleware = CreateAdventureNodeMiddleware();

      middleware.call(store, action, (dynamic _) => null);

      // Verify Adventure was created.
      verify(mockService.createDocument(at: 'adventures', from: {
        'ownerIds': [exampleAuthUser.uid],
        'name': action.name
      }));

      // Update state to having a selected Adventure.
      var adventure = const AdventureModel(id: 'id', name: 'adventure!');
      var selectedAdventureState =
          signedInAppState.copyWith.adventures(selected: adventure);
      store.updateState(selectedAdventureState);

      middleware.call(store, action, (dynamic _) => null);

      // Verify Challenge was created.
      verify(mockService.createDocument(at: 'challenges', from: {
        'ownerIds': [exampleAuthUser.uid],
        'name': action.name,
        'parentIds': [adventure.id]
      }));

      // Update state to having a selected Challenge.
      var challenge = const ChallengeModel(id: 'id', name: 'challenge!');
      var selectedChallengeState = store.updateState(
          selectedAdventureState.copyWith.challenges(selected: challenge));

      middleware.call(store, action, (dynamic _) => null);

      // Verify Challenge was created.
      verify(mockService.createDocument(at: 'tasks', from: {
        'ownerIds': [exampleAuthUser.uid],
        'name': action.name,
        'parentIds': [challenge.id]
      }));
    });
  });
}
