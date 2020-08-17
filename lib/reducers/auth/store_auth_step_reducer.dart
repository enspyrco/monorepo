import 'package:flireator/actions/auth/store_auth_step.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreAuthStepReducer extends TypedReducer<AppState, StoreAuthStep> {
  StoreAuthStepReducer()
      : super(
            (state, action) => state.rebuild((b) => b..authStep = action.step));
}
