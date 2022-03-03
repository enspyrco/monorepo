import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/update_organisations_page_action.dart';

class UpdateOrganisationsPageReducer
    extends TypedReducer<AppState, UpdateOrganisationsPageAction> {
  UpdateOrganisationsPageReducer()
      : super((state, action) {
          final nextCreating =
              action.creating ?? state.organisations.creator.creating;
          final nextDeleting = action.deleting ?? state.organisations.deleting;

          return state.copyWith.organisations(
              creator:
                  state.organisations.creator.copyWith(creating: nextCreating),
              deleting: nextDeleting);
        });
}
