import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/shared/actions/select_adventure_node_action.dart';
import 'package:adventure_maker/shared/middleware/select_adventure_node_middleware.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/services.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('SelectAdventureNodeMiddleware', () {
    test('catches errors and dispatches AddProblemAction', () {
      // Create test-doubles.
      var node = const AdventureModel(name: 'a node name');
      var action = SelectAdventureNodeAction(node);
      var exampleAuthUser = AuthUserDataExample.minimal;
      var signedInAppState =
          AppState.init().copyWith.auth(userData: exampleAuthUser);
      var store = FakeStore(signedInAppState);
      var mockService = MockFlutterfireFirestoreService();

      // Stub test-doubles.
      when(mockService.getDocuments(
        at: anyNamed('at'),
        where: anyNamed('where'),
        arrayContains: anyNamed('arrayContains'),
      )).thenThrow('error');

      // Provide test-doubles.
      RedFireLocator.provide(firestoreService: mockService);

      var middleware = SelectAdventureNodeMiddleware();

      // Call the middleware.
      middleware.call(store, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(store.dispatched.last is AddProblemAction, true);
    });

    test('retrieves children for the selected node', () {
      // Create test-doubles.
      var selection = const AdventureModel(name: 'a node name');
      var action = SelectAdventureNodeAction(selection);
      var exampleAuthUser = AuthUserDataExample.minimal;
      var signedInAppState =
          AppState.init().copyWith.auth(userData: exampleAuthUser);
      var store = FakeStore(signedInAppState);
      var mockService = MockFlutterfireFirestoreService();

      // Stub test-doubles.
      when(mockService.getDocuments(
              at: anyNamed('at'),
              where: anyNamed('where'),
              arrayContains: anyNamed('arrayContains')))
          .thenAnswer((_) => Future.value([
                <String, Object?>{'id': 'id'}
              ]));

      // Provide test-doubles.
      RedFireLocator.provide(firestoreService: mockService);

      var middleware = SelectAdventureNodeMiddleware();

      middleware.call(store, action, (dynamic _) => null);

      // Verify relevant challenges were read.
      verify(mockService.getDocuments(
          at: 'challenges', where: 'parentIds', arrayContains: selection.id));
    });
  });
}
