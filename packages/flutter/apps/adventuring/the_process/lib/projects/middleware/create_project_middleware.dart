import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../../organisations/models/organisation_model.dart';
import '../actions/create_project_action.dart';
import '../actions/update_projects_view_action.dart';
import '../models/project_state.dart';

class CreateProjectMiddleware
    extends TypedMiddleware<AppState, CreateProjectAction> {
  CreateProjectMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            OrganisationModel? selected =
                store.state.organisations.selector.selected;
            if (selected == null) return;

            String uid = store.state.auth.userData!.uid;

            ProjectState project = action.project.copyWith(
                ownerIds: ISet([uid]), organisationIds: ISet([selected.id]));

            final service = RedFireLocator.getDatabaseService();

            await service.createDocument(
                at: 'projects', from: project.toJson());
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          } finally {
            store.dispatch(const UpdateProjectsViewAction(creating: false));
          }
        });
}
