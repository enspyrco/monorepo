import 'package:redfire/auth/actions/store_auth_user_data_action.dart';
import 'package:redfire/types/red_fire_state.dart';
import 'package:redux/redux.dart';

class StoreAuthUserDataReducer<T extends RedFireState>
    extends TypedReducer<T, StoreAuthUserDataAction> {
  StoreAuthUserDataReducer()
      : super(
          (state, action) => (state as dynamic)
              .copyWith(authUserData: action.authUserData) as T,
        );
}
