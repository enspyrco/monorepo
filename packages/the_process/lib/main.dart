import 'package:flutter/material.dart';
import 'package:redfire/widgets.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/home/widgets/home_page.dart';
import 'package:the_process/organisations/actions/tap_organisations_action.dart';
import 'package:the_process/organisations/middleware/create_organisation_middleware.dart';
import 'package:the_process/organisations/middleware/delete_organisation_middleware.dart';
import 'package:the_process/organisations/middleware/tap_organisations_middleware.dart';
import 'package:the_process/organisations/pages/manage_organisations_page.dart';
import 'package:the_process/organisations/reducers/set_organisations_reducer.dart';
import 'package:the_process/organisations/reducers/set_selected_organisation_reducer.dart';
import 'package:the_process/organisations/reducers/update_organisations_page_reducer.dart';
import 'package:the_process/projects/middleware/create_project_middleware.dart';
import 'package:the_process/projects/middleware/tap_projects_middleware.dart';
import 'package:the_process/projects/pages/project_detail_page.dart';
import 'package:the_process/projects/reducers/set_projects_reducer.dart';
import 'package:the_process/projects/reducers/update_projects_view.dart';
import 'package:the_process/sections/middleware/create_section_middleware.dart';
import 'package:the_process/sections/middleware/tap_sections_middleware.dart';
import 'package:the_process/sections/reducers/set_sections_reducer.dart';
import 'package:the_process/sections/reducers/update_new_section_v_m_reducer.dart';
import 'package:the_process/sections/reducers/update_sections_v_m_reducer.dart';

void main() => runApp(AppWidget<AppState>(
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
      pageTransforms: [
        ManageOrganisationsPageTransforms(),
        ProjectDetailPageTransforms(),
      ],
      mainPage: const HomePage(),
    ));
