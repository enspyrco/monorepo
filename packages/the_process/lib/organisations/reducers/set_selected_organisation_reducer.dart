import 'package:redux/redux.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/organisations/actions/set_selected_organisation_action.dart';

class SetSelectedOrganisationReducer
    extends TypedReducer<AppState, SetSelectedOrganisationAction> {
  SetSelectedOrganisationReducer()
      : super((state, action) => state.copyWith.organisations
            .selector(selected: action.organisation));
}
