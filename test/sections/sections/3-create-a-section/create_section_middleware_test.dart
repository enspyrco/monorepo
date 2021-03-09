import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_process/actions/sections/create_section_action.dart';
import 'package:the_process/actions/sections/update_sections_v_m_action.dart';
import 'package:the_process/middleware/sections/create_section.dart';
import 'package:the_process/models/app_state/app_state.dart';

import '../../../data/models/auth_user_data_examples.dart';
import '../../../mocks/redux/fake_store.dart';
import '../../../mocks/services/http_service_mock.dart';

void main() {
  group('CreateSectionMiddleware', () {
    test('dispatches UpdateSectionsVM and calls DatabaseServce.createSection',
        () async {
      var state = AppState.init();
      state = state.copyWith(
          authUserData: AuthUserDataExamples.minimal,
          sections: state.sections.copyWith.newSection(name: 'testy'));
      final fakeStore = FakeStore(state: state);
      final httpServiceMock = HttpServiceMock();
      final nullDispatcher = (dynamic _) => null;

      // Create then invoke the middleware under test.
      final middleware = CreateSectionMiddleware(httpServiceMock);
      await middleware(fakeStore, CreateSectionAction(), nullDispatcher);

      verifyInOrder<dynamic>(<dynamic>[
        fakeStore.dispatch(UpdateSectionsVMAction(creatingNewSection: true)),
      ]);

      verify(httpServiceMock.createSection(name: 'testy'));
    });
  });
}
