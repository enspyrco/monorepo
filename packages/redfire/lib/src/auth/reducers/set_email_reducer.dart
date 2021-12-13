import 'package:redux/redux.dart';

import '../../types/red_fire_state.dart';
import '../actions/email/set_email_action.dart';

class SetEmailReducer<T extends RedFireState>
    extends TypedReducer<T, SetEmailAction> {
  SetEmailReducer()
      : super(
          (state, action) =>
              (state as dynamic).copyWith.auth.emailVM(email: action.text) as T,
        );
}
