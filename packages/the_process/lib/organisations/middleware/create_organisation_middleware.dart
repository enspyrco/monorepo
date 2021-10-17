import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';
import 'package:the_process/organisations/actions/create_organisation_action.dart';
import 'package:the_process/organisations/actions/update_organisation_selector_action.dart';
import 'package:the_process/organisations/models/organisation_model.dart';

class CreateOrganisationMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, CreateOrganisationAction> {
  CreateOrganisationMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            store.dispatch(UpdateOrganisationSelectorAction(creating: true));

            var organisation = OrganisationModel(
              name: action.name,
              owners: ISet({store.state.auth.userData!.uid}),
            );

            final service = RedFireLocator.getDatabaseService();
            await service.createDocument(
                at: 'organisations', from: organisation.toJson());
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          } finally {
            store.dispatch(UpdateOrganisationSelectorAction(creating: false));
          }
        });
}
