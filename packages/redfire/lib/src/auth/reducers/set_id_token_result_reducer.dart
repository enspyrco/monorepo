import 'package:redfire/src/auth/actions/set_id_token_result_action.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redux/redux.dart';

class SetIdTokenResultReducer<T extends RedFireState>
    extends TypedReducer<T, SetIdTokenResultAction> {
  SetIdTokenResultReducer()
      : super(
          (state, action) => (state as dynamic)
              .copyWith
              .auth(idTokenResult: action.result) as T,
        );
}
