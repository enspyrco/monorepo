import 'package:redfire/src/auth/actions/email/set_email_action.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redux/redux.dart';

class SetEmailReducer<T extends RedFireState>
    extends TypedReducer<T, SetEmailAction> {
  SetEmailReducer()
      : super(
          (state, action) =>
              (state as dynamic).copyWith.auth.emailVM(email: action.text) as T,
        );
}
