import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/actions/observe_auth_state_action.dart';
import 'package:redfire/utils/dev_tools_middleware.dart';

import 'test-data/app_state.dart';
import 'test-doubles/fake_store.dart';

void main() {
  group('DevToolsMiddleware', () {
    test('post events with serialized action and state', () async {
      var state = AppState.init();
      final fakeStore = FakeStore(state: state);
      final nullDispatcher = (dynamic _) => null;

      // Create then invoke the middleware under test.
      final middleware = DevToolsMiddleware();
      await middleware(fakeStore, ObserveAuthStateAction(), nullDispatcher);

      // TODO: inject a wrapper around postEvent so we can mock it and verify calls
    });
  });
}
