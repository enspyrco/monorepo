import 'package:redux/redux.dart';

import '../../../types.dart';
import '../actions/email/set_providers_for_email_action.dart';

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
