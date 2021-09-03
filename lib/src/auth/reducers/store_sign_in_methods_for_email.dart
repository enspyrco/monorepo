import 'package:redfire/src/auth/actions/email/store_sign_in_methods_for_email_action.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

class StoreSignInMethodsForEmailReducer<T extends RedFireState>
    extends TypedReducer<T, StoreSignInMethodsForEmailAction> {
  StoreSignInMethodsForEmailReducer()
      : super(
          (state, action) => (state as dynamic)
              .copyWith
              .auth(signInMethodsForEmail: action.methods) as T,
        );
}
