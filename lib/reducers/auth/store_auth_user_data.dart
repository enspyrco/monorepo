import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/store_auth_user_data_action.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/models/app_state/app_state.dart';

class StoreAuthUserDataReducer
    extends TypedReducer<AppState, StoreAuthUserDataAction> {
  StoreAuthUserDataReducer()
      : super((state, action) {
          // guard statement to avoid further null checks
          if (action.authUserData == null) {
            return state.copyWith(
                authUserData: null, authStep: AuthStep.waitingForInput);
          }

          return state.copyWith(
              authUserData: action.authUserData,
              authStep: AuthStep.waitingForInput);
        });
}
