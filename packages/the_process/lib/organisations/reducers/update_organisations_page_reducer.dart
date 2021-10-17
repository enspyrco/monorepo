import 'package:redux/redux.dart';
import 'package:the_process/main.dart';
import 'package:the_process/organisations/actions/update_organisations_page_action.dart';

class UpdateOrganisationsPageReducer
    extends TypedReducer<AppState, UpdateOrganisationsPageAction> {
  UpdateOrganisationsPageReducer()
      : super((state, action) {
          final nextSelected =
              action.selected ?? state.organisations.selector.selected;
          final nextCreating =
              action.creating ?? state.organisations.creator.creating;
          final nextDeleting = action.deleting ?? state.organisations.deleting;

          return state.copyWith.organisations(
              selector:
                  state.organisations.selector.copyWith(selected: nextSelected),
              creator:
                  state.organisations.creator.copyWith(creating: nextCreating),
              deleting: nextDeleting);
        });
}
