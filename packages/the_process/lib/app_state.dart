import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'organisations/models/organisations_section_model.dart';
import 'projects/models/projects_section.dart';
import 'projects/models/sections_v_m.dart';
import 'teams/models/team_member.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

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
        pages: <PageData>[const InitialPageData()].lock,
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
