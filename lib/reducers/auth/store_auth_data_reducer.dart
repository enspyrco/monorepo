import 'package:flireator/actions/auth/store_auth_data.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreAuthDataReducer extends TypedReducer<AppState, StoreAuthData> {
  StoreAuthDataReducer()
      : super((state, action) {
          // null data indicates the not signed state
          if (action.data == null) {
            return state.rebuild((b) => b..authData = null);
          }

          // store the user data and create a flireator with just the good stuff
          return state.rebuild((b) => b..authData = action.data?.toBuilder());
        });
}
