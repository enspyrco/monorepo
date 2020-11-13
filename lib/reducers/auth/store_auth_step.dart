import 'package:redux/redux.dart';
import 'package:the_process/actions/auth/store_auth_step.dart';
import 'package:the_process/models/app_state/app_state.dart';

class StoreAuthStepReducer extends TypedReducer<AppState, StoreAuthStep> {
  StoreAuthStepReducer()
      : super(
            (state, action) => state.rebuild((b) => b..authStep = action.step));
}
