import 'package:redux/redux.dart';

import '../../../types.dart';
import '../../auth/actions/sign_out_action.dart';

class SignOutReducer<T extends RedFireState>
    extends TypedReducer<T, SignOutAction> {
  SignOutReducer()
      : super(
            (state, action) => (state as dynamic).copyWith(profile: null) as T);
}
