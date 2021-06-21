import 'package:redfire/src/auth/actions/store_auth_user_data_action.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redux/redux.dart';

class StoreAuthUserDataReducer<T extends RedFireState>
    extends TypedReducer<T, StoreAuthUserDataAction> {
  StoreAuthUserDataReducer()
      : super(
          (state, action) => (state as dynamic)
              .copyWith(authUserData: action.authUserData) as T,
        );
}
