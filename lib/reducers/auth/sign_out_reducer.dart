import 'package:flireator/actions/auth/sign_out.dart';
import 'package:flireator/enums/auth/auth_step.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class SignOutReducer extends TypedReducer<AppState, SignOut> {
  SignOutReducer()
      : super((state, action) => state.rebuild((b) => b
          ..gitHubToken = null
          ..authStep = AuthStep.signingOut));
}
