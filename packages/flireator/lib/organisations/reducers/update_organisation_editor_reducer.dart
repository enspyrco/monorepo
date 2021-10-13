import 'package:flireator/main.dart';
import 'package:flireator/organisations/actions/update_organisations_view_action.dart';
import 'package:redux/redux.dart';

class UpdateOrganisationEditorReducer
    extends TypedReducer<AppState, UpdateOrganisationsViewAction> {
  UpdateOrganisationEditorReducer()
      : super((state, action) {
          final oldSelected = state.organisations.editor.selector.selected;
          final oldCreating = state.organisations.editor.creator.creating;
          final newState = state.copyWith.organisations.editor
              .selector(selected: action.selected ?? oldSelected);
          return newState.copyWith.organisations.editor
              .creator(creating: action.creating ?? oldCreating);
        });
}
