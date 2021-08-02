import 'package:redfire/actions.dart';
import 'package:redfire/src/auth/actions/observe_auth_state_action.dart';
import 'package:redfire/src/auth/actions/sign_in_with_apple_action.dart';
import 'package:redfire/src/auth/actions/sign_in_with_google_action.dart';
import 'package:redfire/src/auth/middleware/observe_auth_state_middleware.dart';
import 'package:redfire/src/auth/middleware/sign_in_with_apple_middleware.dart';
import 'package:redfire/src/auth/middleware/sign_in_with_google_middleware.dart';
import 'package:redfire/src/auth/middleware/sign_out_middleware.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('ObserveAuthStateMiddleware', () {
    test('should ', () async {
      final mockStore = MockStore<RedFireState>();

      // Create then invoke the middleware under test.
      final middleware = ObserveAuthStateMiddleware();
      await middleware(
          mockStore, ObserveAuthStateAction(), (dynamic _) => null);
      expect(true, false);
    });
  });

  group('SignInWithAppleMiddleware', () {
    test('should ', () async {
      final mockStore = MockStore<RedFireState>();

      // Create then invoke the middleware under test.
      final middleware = SignInWithAppleMiddleware();
      await middleware(mockStore, SignInWithAppleAction(), (dynamic _) => null);
      expect(true, false);
    });
  });

  group('SignInWithGoogleMiddleware', () {
    test('should ', () async {
      final mockStore = MockStore<RedFireState>();

      // Create then invoke the middleware under test.
      final middleware = SignInWithGoogleMiddleware();
      await middleware(mockStore, SignInWithGoogleAction, (dynamic _) => null);
      expect(true, false);
    });
  });

  group('SignOutMiddleware', () {
    test('should ', () async {
      final mockStore = MockStore<RedFireState>();

      // Create then invoke the middleware under test.
      final middleware = SignOutMiddleware();
      await middleware(mockStore, SignOutAction(), (dynamic _) => null);
      expect(true, false);
    });
  });
}
