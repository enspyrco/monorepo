import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';
import 'package:the_process/middleware/project_sections/create_project_section_middleware.dart';
import 'package:the_process/middleware/project_sections/tap_project_sections_middleware.dart';
import 'package:the_process/organisations/actions/tap_organisations_action.dart';
import 'package:the_process/organisations/middleware/create_organisation_middleware.dart';
import 'package:the_process/organisations/middleware/tap_organisations_middleware.dart';
import 'package:the_process/organisations/models/organisations_section_model.dart';
import 'package:the_process/organisations/pages/edit_organisations_page.dart';
import 'package:the_process/organisations/reducers/set_organisations_reducer.dart';
import 'package:the_process/organisations/reducers/update_organisation_selector_reducer.dart';
import 'package:the_process/projects/pages/project_detail_page.dart';
import 'package:the_process/reducers/sections/store_project_sections.dart';
import 'package:the_process/reducers/sections/update_new_project_section_v_m.dart';
import 'package:the_process/reducers/sections/update_project_sections_v_m.dart';

import 'models/project_sections/project_sections_v_m.dart';
import 'models/team/team_member.dart';
import 'widgets/home/home_page.dart';

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
    ProfileData? profile,

    /// Sections
    required ProjectSectionsVM sections,

    /// Teams
    TeamMember? teamMember,
    required OrganisationsSectionModel organisations,
  }) = _AppState;

  factory AppState.init() => AppState(
        auth: AuthState.init(),
        pages: <PageData>[InitialPageData()].lock,
        problems: IList(),
        settings: Settings.init(),

        /// Sections
        sections: ProjectSectionsVM.init(),

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
        CreateProjectSectionMiddleware(),
        TapProjectSectionsMiddleware(),

        /// Organisations
        CreateOrganisationMiddleware(),
        TapOrganisationsMiddleware(),
      ],
      reducers: [
        /// Sections
        StoreProjectSectionsReducer(),
        UpdateNewProjectSectionVMReducer(),
        UpdateProjectSectionsVMReducer(),

        /// Organisations
        UpdateOrganisationSelectorReducer(),
        SetOrganisationsReducer(),
      ],
      pageTransforms: [
        EditOrganisationsPageTransforms(),
        ProjectDetailPageTransforms()
      ],
      mainPage: const HomePage(),
    ));
