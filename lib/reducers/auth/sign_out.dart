import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/sign_out.dart';
import 'package:the_process/models/app_state/app_state.dart';

class SignOutReducer extends TypedReducer<AppState, SignOut> {
  SignOutReducer()
      : super((state, action) => state.rebuild((b) => b..profileData = null));
}
