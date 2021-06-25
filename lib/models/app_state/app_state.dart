import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/enums/auth/auth_step_enum.dart';
import 'package:the_process/models/auth/auth_user_data.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/models/profile/profile_data.dart';
import 'package:the_process/models/sections/sections_v_m.dart';
import 'package:the_process/models/settings/settings.dart';
import 'package:the_process/models/team/team_member.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  @JsonSerializable(explicitToJson: true)
  factory AppState({
    /// Teams
    TeamMember? teamMember,

    /// Auth
    required AuthStepEnum authStep,
    AuthUserData? authUserData,

    /// Navigation
    required IList<PageData> pagesData,

    /// Problems
    required IList<Problem> problems,

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
      problems: IList(),
      pagesData: <PageData>[const InitialPageData()].lock,
      authStep: AuthStepEnum.checking,
      settings: Settings.init(),
      sections: SectionsVM.init());
}
