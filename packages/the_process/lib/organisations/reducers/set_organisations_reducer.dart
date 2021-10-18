import 'package:redux/redux.dart';
import 'package:the_process/main.dart';
import 'package:the_process/organisations/actions/set_organisations_action.dart';
import 'package:the_process/organisations/models/organisation_model.dart';

class SetOrganisationsReducer
    extends TypedReducer<AppState, SetOrganisationsAction> {
  SetOrganisationsReducer()
      : super((state, action) {
          // Determine the selected organisation
          OrganisationModel? nextSelected;

          // Find any added organisatons.
          var added = action.organisations
              .difference(state.organisations.selector.all)
              .firstOrNull;
          // Find any removed organisatons.
          var removed = state.organisations.selector.all
              .difference(action.organisations)
              .firstOrNull;

          // If an organisation was removed, selected will be set to null.
          // If org was added, it gets set as the selected org.
          // Otherwise leave selected as it was.
          if (removed == null) {
            nextSelected = added ?? state.organisations.selector.selected;
          }

          return state.copyWith.organisations
              .selector(all: action.organisations, selected: nextSelected);
        });
}
