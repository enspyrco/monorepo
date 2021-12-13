import 'package:redux/redux.dart';

import '../../types/red_fire_state.dart';
import '../actions/set_id_token_result_action.dart';

class SetIdTokenResultReducer<T extends RedFireState>
    extends TypedReducer<T, SetIdTokenResultAction> {
  SetIdTokenResultReducer()
      : super(
          (state, action) => (state as dynamic)
              .copyWith
              .auth(idTokenResult: action.result) as T,
        );
}
