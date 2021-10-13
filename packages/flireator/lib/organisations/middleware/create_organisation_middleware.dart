import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flireator/organisations/actions/create_organisation_action.dart';
import 'package:flireator/organisations/actions/update_organisations_view_model_action.dart';
import 'package:flireator/organisations/models/organisation.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

class CreateOrganisationMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, CreateOrganisationAction> {
  CreateOrganisationMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            var organisation = Organisation(
              name: action.name,
              owners: ISet({store.state.auth.userData!.uid}),
            );

            final service = RedFireLocator.getDatabaseService();
            await service.createDocument(
                at: 'organisations', from: organisation.toJson());
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          } finally {
            store.dispatch(UpdateOrganisationsViewModelAction(creating: false));
          }
        });
}
