import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/set_organisations_action.dart';

class SetOrganisationsReducer
    extends TypedReducer<AppState, SetOrganisationsAction> {
  SetOrganisationsReducer()
      : super((state, action) {
          return state.copyWith.organisations
              .selector(all: action.organisations);
        });
}
