import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../app/state/app_state.dart';
import '../../organisations/models/organisation_model.dart';
import '../models/project_state.dart';
import '../models/update_projects_view.dart';

class CreateProject extends AwayMission<AppState> {
  CreateProject(ProjectState project) : _project = project;

  final ProjectState _project;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    try {
      OrganisationModel? selected =
          missionControl.state.organisations.selector.selected;
      if (selected == null) return;

      String uid = missionControl.state.auth.user.uid!;

      ProjectState project =
          _project.copyWith(ownerIds: {uid}, organisationIds: {selected.id});

      var service = locate<FirestoreService>();

      await service.createDocument(at: 'projects', from: project.toJson());
    } catch (error) {
      throw error;
    } finally {
      missionControl.land(UpdateProjectsView(creating: false));
    }
  }

  @override
  toJson() => {
        'name_': 'CreateProject',
        'state_': _project.toJson(),
      };
}
