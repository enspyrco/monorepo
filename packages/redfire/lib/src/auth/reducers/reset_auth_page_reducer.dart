import 'package:redux/redux.dart';

import '../../../types.dart';
import '../../types/red_fire_state.dart';
import '../actions/reset_auth_page_action.dart';

class ResetAuthPageReducer<T extends RedFireState>
    extends TypedReducer<T, ResetAuthPageAction> {
  ResetAuthPageReducer()
      : super((state, action) {
          return (state as dynamic).copyWith.auth(
              step: AuthStepEnum.waitingForInput,
              emailVM: state.auth.emailVM
                  .copyWith(email: null, providers: null)) as T;
        });
}
