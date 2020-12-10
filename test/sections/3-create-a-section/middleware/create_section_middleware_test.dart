import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_process/actions/sections/create_section.dart';
import 'package:the_process/actions/sections/update_sections_v_m.dart';
import 'package:the_process/middleware/sections/create_section.dart';

import '../../../data/models/auth_user_data_example.dart';
import '../../../mocks/redux/fake_store.dart';
import '../../../mocks/services/database_service_mocks.dart';

void main() {
  group('CreateSectionMiddleware', () {
    test('dispatches UpdateSectionsVM and calls DatabaseServce.createSection',
        () async {
      final fakeStore = FakeStore(
          updates: (b) => b
            ..authUserData.replace(AuthUserDataExample.minimal)
            ..sections.newSection.name = 'testy');
      final mockDatabaseService = MockDatabaseService();
      final nullDispatcher = (dynamic _) => null;

      // Create then invoke the middleware under test.
      final middleware = CreateSectionMiddleware(mockDatabaseService);
      await middleware(fakeStore, CreateSection(), nullDispatcher);

      verifyInOrder<dynamic>(<dynamic>[
        fakeStore.dispatch(UpdateSectionsVM(creatingNewSection: true)),
      ]);

      verify(mockDatabaseService.createSection(uid: 'uid', name: 'testy'));
    });
  });
}
