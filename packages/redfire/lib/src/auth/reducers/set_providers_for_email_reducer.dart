import 'package:redfire/src/auth/actions/email/set_providers_for_email_action.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

class SetProvidersForEmailReducer<T extends RedFireState>
    extends TypedReducer<T, SetProvidersForEmailAction> {
  SetProvidersForEmailReducer()
      : super((state, action) {
          return (state as dynamic)
              .copyWith
              .auth
              .emailVM(providers: action.providers) as T;
        });
}
