import 'package:flireator/main.dart';
import 'package:flireator/organisations/actions/set_organisations_action.dart';
import 'package:redux/redux.dart';

class SetOrganisationsReducer
    extends TypedReducer<AppState, SetOrganisationsAction> {
  SetOrganisationsReducer()
      : super(
          (state, action) => state.copyWith.organisations.editor
              .selector(all: action.organisations),
        );
}
