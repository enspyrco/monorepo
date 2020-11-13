import 'package:redux/redux.dart';
import 'package:the_process/actions/profile/store_profile_data.dart';
import 'package:the_process/models/app_state/app_state.dart';

class StoreProfileDataReducer extends TypedReducer<AppState, StoreProfileData> {
  StoreProfileDataReducer()
      : super((state, action) =>
            state.rebuild((b) => b..profileData.replace(action.data)));
}
