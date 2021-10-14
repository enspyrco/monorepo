import 'package:redux/redux.dart';
import 'package:the_process/main.dart';
import 'package:the_process/organisations/actions/update_organisations_view_action.dart';

class UpdateOrganisationEditorReducer
    extends TypedReducer<AppState, UpdateOrganisationsViewAction> {
  UpdateOrganisationEditorReducer()
      : super((state, action) {
          final oldSelected = state.organisations.selector.selected;
          final oldCreating = state.organisations.creator.creating;
          final newState = state.copyWith.organisations
              .selector(selected: action.selected ?? oldSelected);
          return newState.copyWith.organisations
              .creator(creating: action.creating ?? oldCreating);
        });
}
