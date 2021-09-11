import 'package:redfire/actions.dart';
import 'package:redfire/src/auth/actions/sign_in_with_google_action.dart';
import 'package:redfire/src/auth/middleware/sign_in_with_google_middleware.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('SignInWithGoogleMiddleware', () {
    test('should ', () async {
      final mockStore = MockStore<RedFireState>();

      // Create then invoke the middleware under test.
      final middleware = SignInWithGoogleMiddleware();
      await middleware(mockStore, SignInWithGoogleAction, (dynamic _) => null);
      expect(true, false);
    });
  });
}
