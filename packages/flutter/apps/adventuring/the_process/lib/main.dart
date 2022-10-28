import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:redfire/utils.dart';
import 'package:redfire/widgets.dart';

import 'app_state.dart';
import 'home/home_screen.dart';
import 'organisations/actions/tap_organisations_action.dart';
import 'organisations/middleware/create_organisation_middleware.dart';
import 'organisations/middleware/delete_organisation_middleware.dart';
import 'organisations/middleware/tap_organisations_middleware.dart';
import 'organisations/pages/manage_organisations_page.dart';
import 'organisations/reducers/set_organisations_reducer.dart';
import 'organisations/reducers/set_selected_organisation_reducer.dart';
import 'organisations/reducers/update_organisations_page_reducer.dart';
import 'projects/middleware/create_project_middleware.dart';
import 'projects/middleware/tap_projects_middleware.dart';
import 'projects/pages/project_detail_page.dart';
import 'projects/reducers/set_projects_reducer.dart';
import 'projects/reducers/update_projects_view.dart';
import 'redfire_options.dart';
import 'sections/middleware/create_section_middleware.dart';
import 'sections/middleware/tap_sections_middleware.dart';
import 'sections/reducers/set_sections_reducer.dart';
import 'sections/reducers/update_new_section_v_m_reducer.dart';
import 'sections/reducers/update_sections_v_m_reducer.dart';

void main() => runApp(AppWidget<AppState>(
      config: RedFireOptions.currentPlatform,
      logins: {
        EmailLoginConfig(),
        PlatformDefaultLoginConfig(clientId: RedFireOptions.web.auth.clientId!),
      }.lock,
      initialState: AppState.init(),
      initialActions: const [TapOrganisationsAction()],
      middlewares: [
        /// Sections
        CreateSectionMiddleware(),
        TapSectionsMiddleware(),

        /// Organisations
        CreateOrganisationMiddleware(),
        TapOrganisationsMiddleware(),
        DeleteOrganisationMiddleware(),

        /// Projects
        CreateProjectMiddleware(),
        TapProjectsMiddleware(),
      ],
      reducers: [
        /// Sections
        SetSectionsReducer(),
        UpdateNewSectionVMReducer(),
        UpdateSectionsVMReducer(),

        /// Organisations
        UpdateOrganisationsPageReducer(),
        SetOrganisationsReducer(),
        SetSelectedOrganisationReducer(),

        /// Projects
        UpdateProjectsViewReducer(),
        SetProjectsReducer(),
      ],
      pageTransforms: {
        ManageOrganisationsPageTransforms(),
        ProjectDetailPageTransforms(),
      }.lock,
      homePage: const HomeScreen(),
    ));
