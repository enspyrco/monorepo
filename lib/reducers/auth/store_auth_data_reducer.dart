import 'package:flireator/actions/auth/store_auth_data_action.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// If the action holds null in [data], this indicates the not signed state
/// Otherwise we store the user data and create a flireator with just the good stuff
class StoreAuthDataReducer extends TypedReducer<AppState, StoreAuthDataAction> {
  StoreAuthDataReducer()
      : super((state, action) => (action.data == null)
            ? state.copyWith(authData: null)
            : state.copyWith(authData: action.data));
}
