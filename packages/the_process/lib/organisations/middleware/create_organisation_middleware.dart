import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';
import 'package:the_process/main.dart';
import 'package:the_process/organisations/actions/create_organisation_action.dart';
import 'package:the_process/organisations/actions/update_organisations_page_action.dart';

class CreateOrganisationMiddleware
    extends TypedMiddleware<AppState, CreateOrganisationAction> {
  CreateOrganisationMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            store.dispatch(UpdateOrganisationsPageAction(creating: true));

            var organisationJson = <String, Object?>{
              'name': action.name,
              'owners': [store.state.auth.userData!.uid],
            };

            final service = RedFireLocator.getDatabaseService();
            await service.createDocument(
                at: 'organisations', from: organisationJson);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          } finally {
            store.dispatch(UpdateOrganisationsPageAction(creating: false));
          }
        });
}
