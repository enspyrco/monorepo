import 'package:redux/redux.dart';
import 'package:the_process/main.dart';
import 'package:the_process/organisations/actions/set_organisations_action.dart';

class SetOrganisationsReducer
    extends TypedReducer<AppState, SetOrganisationsAction> {
  SetOrganisationsReducer()
      : super((state, action) {
          var nextSelected = action.organisations
                  .difference(state.organisations.selector.all)
                  .firstOrNull ??
              state.organisations.selector.selected;

          return state.copyWith.organisations
              .selector(all: action.organisations, selected: nextSelected);
        });
}
