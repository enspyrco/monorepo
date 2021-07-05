import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/src/auth/actions/observe_auth_state_action.dart';
import 'package:redfire/src/utils/dev_tools_middleware.dart';
import 'package:redfire_test/redfire_test.dart';

import 'test-data/app_state/app_state.dart';

void main() {
  group('DevToolsMiddleware', () {
    test('post events with serialized action and state', () async {
      var state = AppState.init();
      final fakeStore = FakeStore(state);
      final nullDispatcher = (dynamic _) => null;

      // Create then invoke the middleware under test.
      final middleware = DevToolsMiddleware();
      await middleware(fakeStore, ObserveAuthStateAction(), nullDispatcher);

      // The rest of the test is waiting for when we have a wrapper around
      // postEvent so we can mock, inject it and verify calls.
    });
  });
}
