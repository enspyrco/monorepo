import 'package:redfire/actions.dart';
import 'package:redfire/src/auth/middleware/sign_out_middleware.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
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
