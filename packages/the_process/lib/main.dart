import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';
import 'package:the_process/home/widgets/home_page.dart';
import 'package:the_process/organisations/actions/tap_organisations_action.dart';
import 'package:the_process/organisations/middleware/create_organisation_middleware.dart';
import 'package:the_process/organisations/middleware/delete_organisation_middleware.dart';
import 'package:the_process/organisations/middleware/tap_organisations_middleware.dart';
import 'package:the_process/organisations/models/organisations_section_model.dart';
import 'package:the_process/organisations/pages/manage_organisations_page.dart';
import 'package:the_process/organisations/reducers/set_organisations_reducer.dart';
import 'package:the_process/organisations/reducers/update_organisations_page_reducer.dart';
import 'package:the_process/projects/models/projects_section.dart';
import 'package:the_process/projects/models/sections_v_m.dart';
import 'package:the_process/projects/pages/project_detail_page.dart';
import 'package:the_process/sections/middleware/create_section_middleware.dart';
import 'package:the_process/sections/middleware/tap_sections_middleware.dart';
import 'package:the_process/sections/reducers/set_sections_reducer.dart';
import 'package:the_process/sections/reducers/update_new_section_v_m_reducer.dart';
import 'package:the_process/sections/reducers/update_sections_v_m_reducer.dart';
import 'package:the_process/teams/models/team_member.dart';

part 'main.freezed.dart';
part 'main.g.dart';

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    /// RedFire
    @PageDataConverter() required IList<PageData> pages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    required AuthState auth,

    /// Profile
    ProfileData? profile,

    /// Organisations
    required OrganisationsSectionModel organisations,

    /// Projects
    required ProjectsSection projects,

    /// Sections
    required SectionsVM sections,

    /// Teams
    TeamMember? teamMember,
  }) = _AppState;

  factory AppState.init() => AppState(
        auth: AuthState.init(),
        pages: <PageData>[InitialPageData()].lock,
        problems: IList(),
        settings: Settings.init(),

        /// Projects
        projects: ProjectsSection.init(),

        /// Sections
        sections: SectionsVM.init(),

        /// Organisations
        organisations: OrganisationsSectionModel.init(),
      );

  factory AppState.fromJson(JsonMap json) => _$AppStateFromJson(json);
}

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: [TapOrganisationsAction()],
      middlewares: [
        /// Sections
        CreateSectionMiddleware(),
        TapSectionsMiddleware(),

        /// Organisations
        CreateOrganisationMiddleware(),
        TapOrganisationsMiddleware(),
        DeleteOrganisationMiddleware(),
      ],
      reducers: [
        /// Sections
        SetSectionsReducer(),
        UpdateNewSectionVMReducer(),
        UpdateSectionsVMReducer(),

        /// Organisations
        UpdateOrganisationsPageReducer(),
        SetOrganisationsReducer(),
      ],
      pageTransforms: [
        ManageOrganisationsPageTransforms(),
        ProjectDetailPageTransforms(),
      ],
      mainPage: const HomePage(),
    ));
