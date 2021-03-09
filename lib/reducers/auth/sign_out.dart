import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/sign_out_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

class SignOutReducer extends TypedReducer<AppState, SignOutAction> {
  SignOutReducer()
      : super((state, action) => state.copyWith(profileData: null));
}
