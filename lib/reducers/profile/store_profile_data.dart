import 'package:redux/redux.dart';
import 'package:the_process/actions/profile/store_profile_data_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

class StoreProfileDataReducer
    extends TypedReducer<AppState, StoreProfileDataAction> {
  StoreProfileDataReducer()
      : super((state, action) => state.copyWith(profileData: action.data));
}
