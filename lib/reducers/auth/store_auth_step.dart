import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/store_auth_step_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

class StoreAuthStepReducer extends TypedReducer<AppState, StoreAuthStepAction> {
  StoreAuthStepReducer()
      : super((state, action) => state.copyWith(authStep: action.step));
}
