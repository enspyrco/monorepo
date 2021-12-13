import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/organisations/actions/create_organisation_action.dart';
import 'package:the_process/organisations/actions/update_organisations_page_action.dart';

class CreateOrganisationMiddleware
    extends TypedMiddleware<AppState, CreateOrganisationAction> {
  CreateOrganisationMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            store.dispatch(const UpdateOrganisationsPageAction(creating: true));

            var organisation = action.organisation
                .copyWith(ownerIds: ISet([store.state.auth.userData!.uid]));

            final service = RedFireLocator.getDatabaseService();
            await service.createDocument(
                at: 'organisations', from: organisation.toJson());
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          } finally {
            store
                .dispatch(const UpdateOrganisationsPageAction(creating: false));
          }
        });
}
