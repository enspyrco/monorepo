import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/set_selected_organisation_action.dart';

class SetSelectedOrganisationReducer
    extends TypedReducer<AppState, SetSelectedOrganisationAction> {
  SetSelectedOrganisationReducer()
      : super((state, action) => state.copyWith.organisations
            .selector(selected: action.organisation));
}
