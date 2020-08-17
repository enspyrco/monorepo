import 'package:flireator/actions/auth/store_user_data.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/models/flireator/flireator.dart';
import 'package:redux/redux.dart';

class StoreUserDataReducer extends TypedReducer<AppState, StoreUserData> {
  StoreUserDataReducer()
      : super((state, action) {
          // a null userData indicates the not signed state
          if (action.userData == null) {
            return state.rebuild((b) => b..userData = null);
          }

          // the user data is organised such that the good stuff is tucked away
          final providerData = action.userData.providers.first;

          // store the user data and create a flireator with just the good stuff
          return state.rebuild((b) => b
            ..userData = action.userData?.toBuilder()
            ..flireator.replace(Flireator(
                id: action.userData.uid,
                displayName: providerData.displayName,
                photoURL: providerData.photoUrl)));
        });
}
