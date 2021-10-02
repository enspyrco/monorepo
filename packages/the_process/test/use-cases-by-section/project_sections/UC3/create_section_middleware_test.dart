import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/services.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:the_process/actions/project_sections/create_project_section_action.dart';
import 'package:the_process/actions/project_sections/update_project_sections_v_m_action.dart';
import 'package:the_process/main.dart';
import 'package:the_process/middleware/project_sections/create_project_section_middleware.dart';

void main() {
  group('CreateProjectSectionMiddleware', () {
    test('dispatches UpdateSectionsVM and calls DatabaseServce.createSection',
        () async {
      var state = AppState.init();
      state = state.copyWith(
          auth: state.auth.copyWith(userData: AuthUserDataExample.minimal),
          sections: state.sections.copyWith(newName: 'testy'));
      final fakeStore = FakeStore(state);

      final mockHttpService = MockHttpService();
      RedFireLocator.provide(httpService: mockHttpService);

      // Create then invoke the middleware under test.
      final middleware = CreateProjectSectionMiddleware();
      await middleware(
          fakeStore, CreateProjectSectionAction(), (dynamic _) => null);

      expect(fakeStore.dispatched,
          contains(UpdateProjectSectionsVMAction(creatingNewSection: true)));

      verify(mockHttpService.createSection(name: 'testy'));
    });
  });
}
