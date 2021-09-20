import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/src/auth/actions/email/set_providers_for_email_action.dart';
import 'package:redfire/src/auth/reducers/set_providers_for_email_reducer.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('SetProvidersForEmailReducer', () {
    test('should correctly set providers set', () {
      const testProviders =
          ISetConst(<ProvidersEnum>{ProvidersEnum.apple, ProvidersEnum.email});

      final initialState = ExampleAppState.init();
      expect(initialState.auth.emailVM.email, null);

      final reducer = SetProvidersForEmailReducer();
      final newState = reducer.reducer(
          initialState, SetProvidersForEmailAction(testProviders));

      expect(newState.auth.emailVM.providers, equals(testProviders));
    });
  });
}
