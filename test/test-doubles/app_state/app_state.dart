import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/enums/authentication_enum.dart';
import 'package:redfire/src/auth/models/auth_state.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/settings/models/settings.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redfire/types.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    required IList<PageData> pages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    required AuthState auth,
    ProfileData? profile,
  }) = _AppState;

  factory AppState.init() => AppState(
        pages: <PageData>[const InitialPageData()].lock,
        problems: IList(),
        settings: Settings.init(),
        auth: AuthState(step: AuthenticationEnum.waitingForInput),
      );

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}
