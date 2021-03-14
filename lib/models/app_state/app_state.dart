import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:immutable_collections/immutable_collections.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/models/auth/auth_user_data.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/models/profile/profile_data.dart';
import 'package:the_process/models/sections/sections_v_m.dart';
import 'package:the_process/models/settings/settings.dart';
import 'package:the_process/models/team/team_member.dart';
import 'package:the_process/extensions/list_extensions.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

/// Teams
/// [TeamMember]? teamMember,
///
/// Auth
/// required [AuthStep] authStep,
/// [AuthUserData]? authUserData,
///
/// Navigation
/// required [List<PageData>] pagesData,
///
/// Problems
/// required [List<Problem>] problems,
///
/// Profile
/// [ProfileData]? profileData,
///
/// Sections
/// required [SectionsVM] sections,
///
/// Settings
/// required [Settings] settings,
@freezed
class AppState with _$AppState {
  @JsonSerializable(explicitToJson: true)
  factory AppState({
    /// Teams
    TeamMember? teamMember,

    /// Auth
    required AuthStep authStep,
    AuthUserData? authUserData,

    /// Navigation
    required ImmutableList<PageData> pagesData,

    /// Problems
    required ImmutableList<Problem> problems,

    /// Profile
    ProfileData? profileData,

    /// Sections
    required SectionsVM sections,

    /// Settings
    required Settings settings,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.init() => AppState(
      problems: ImmutableList(),
      pagesData: <PageData>[InitialPageData()].toImmutableList(),
      authStep: AuthStep.checking,
      settings: Settings.init(),
      sections: SectionsVM.init());
}
