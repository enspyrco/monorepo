import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/organisations/actions/delete_organisation_action.dart';
import 'package:the_process/organisations/actions/update_organisations_page_action.dart';

class DeleteOrganisationMiddleware
    extends TypedMiddleware<AppState, DeleteOrganisationAction> {
  DeleteOrganisationMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            store.dispatch(const UpdateOrganisationsPageAction(deleting: true));

            var selected = store.state.organisations.selector.selected;
            if (selected == null) return;

            final service = RedFireLocator.getDatabaseService();
            await service.deleteDocument(at: 'organisations/${selected.id}');
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          } finally {
            store
                .dispatch(const UpdateOrganisationsPageAction(deleting: false));
          }
        });
}
