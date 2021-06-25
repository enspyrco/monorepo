import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_process/actions/sections/create_section_action.dart';
import 'package:the_process/actions/sections/update_sections_v_m_action.dart';
import 'package:the_process/middleware/sections/create_section.dart';
import 'package:the_process/models/app_state/app_state.dart';

import '../../../test-data/models/auth_user_data_examples.dart';
import '../../../test-doubles/redux/fake_store.dart';
import '../../../test-doubles/services/service_test_doubles.mocks.dart';

void main() {
  group('CreateSectionMiddleware', () {
    test('dispatches UpdateSectionsVM and calls DatabaseServce.createSection',
        () async {
      var state = AppState.init();
      state = state.copyWith(
          authUserData: AuthUserDataExamples.minimal,
          sections: state.sections.copyWith.newSection(name: 'testy'));
      final fakeStore = FakeStore(state: state);
      final httpServiceMock = MockHttpService();
      nullDispatcher(dynamic _) => null;

      // Create then invoke the middleware under test.
      final middleware = CreateSectionMiddleware(httpServiceMock);
      await middleware(fakeStore, CreateSectionAction(), nullDispatcher);

      expect(fakeStore.dispatchedActions,
          contains(UpdateSectionsVMAction(creatingNewSection: true)));

      verify(httpServiceMock.createSection(name: 'testy'));
    });
  });
}
