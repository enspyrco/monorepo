import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';
import 'package:the_process/main.dart';
import 'package:the_process/organisations/models/organisation_model.dart';
import 'package:the_process/projects/actions/create_project_action.dart';
import 'package:the_process/projects/actions/update_projects_view_action.dart';
import 'package:the_process/projects/models/project_model.dart';

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

            ProjectModel project = action.project.copyWith(
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
