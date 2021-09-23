import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/src/auth/actions/reset_auth_page_action.dart';
import 'package:redfire/src/auth/reducers/reset_auth_page_reducer.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void aFunc({required String? blah, ISet<int>? ints}) {}
void main() {
  group('ResetAuthPageReducer', () {
    test('resets the Auth Step and EmailAuthVM', () {
      final appState = ExampleAppState.init().copyWith.auth(
          step: AuthStepEnum.signingInWithFirebase,
          emailVM: EmailAuthVM(
              email: 'email', providers: ISet(const [ProvidersEnum.apple])));

      expect(appState.auth.step, AuthStepEnum.signingInWithFirebase);
      expect(appState.auth.emailVM.email, 'email');
      expect(
          appState.auth.emailVM.providers, ISet(const [ProvidersEnum.apple]));
      // initialState.auth.step

      final reducer = ResetAuthPageReducer();
      final newState = reducer.reducer(appState, ResetAuthPageAction());

      expect(newState.auth.step, AuthStepEnum.waitingForInput);
      expect(newState.auth.emailVM.email, null);
      expect(newState.auth.emailVM.providers, null);
    });
  });
}
