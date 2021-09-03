import 'package:redfire/src/auth/actions/email/store_email_action.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redux/redux.dart';

class StoreEmailReducer<T extends RedFireState>
    extends TypedReducer<T, StoreEmailAction> {
  StoreEmailReducer()
      : super(
          (state, action) =>
              (state as dynamic).copyWith.auth(email: action.text) as T,
        );
}
