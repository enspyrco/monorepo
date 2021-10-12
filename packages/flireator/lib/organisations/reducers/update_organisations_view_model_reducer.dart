import 'package:flireator/main.dart';
import 'package:flireator/organisations/actions/update_organisations_view_model_action.dart';
import 'package:redux/redux.dart';

class UpdateOrganisationsViewModelReducer
    extends TypedReducer<AppState, UpdateOrganisationsViewModelAction> {
  UpdateOrganisationsViewModelReducer()
      : super((state, action) {
          AppState newState = state;

          if (action.creating != null) {
            newState = state.copyWith.organisations(creating: action.creating!);
          }

          return newState;
        });
}
