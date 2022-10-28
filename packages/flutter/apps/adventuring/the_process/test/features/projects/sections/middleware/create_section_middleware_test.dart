import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_process/app/state/app_state.dart';

void main() {
  group('CreateProjectSectionMiddleware', () {
    test('dispatches UpdateSectionsVM and calls DatabaseServce.createSection',
        () async {
      var state = AppState.initial;
      state = state.copyWith(
          auth: state.auth.copyWith(userData: AuthUserDataExample.minimal),
          sections: state.sections.copyWith(newName: 'testy'));
      final fakeStore = FakeStore(state);

      final mockHttpService = MockHttpService();
      RedFireLocator.provide(httpService: mockHttpService);

      // Create then invoke the middleware under test.
      final middleware = CreateSectionMiddleware();
      await middleware(fakeStore, const CreateSection(), (dynamic _) => null);

      expect(fakeStore.dispatched,
          contains(const UpdateSectionsState(creatingNewSection: true)));

      verify(mockHttpService.createSection(name: 'testy'));
    });
  });
}
