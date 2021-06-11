import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/auth/enums/auth_step_enum.dart';
import 'package:redfire/auth/models/auth_user_data.dart';
import 'package:redfire/navigation/models/red_fire_page.dart';
import 'package:redfire/problems/models/problem_info.dart';
import 'package:redfire/settings/models/settings.dart';
import 'package:redfire/types/red_fire_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    required IList<RedFirePage> redFirePages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    required AuthStepEnum authStep,
    required AuthUserData? authUserData,
  }) = _AppState;

  factory AppState.init() => AppState(
        redFirePages: <RedFirePage>[RedFireInitialPage()].lock,
        problems: IList(),
        settings: Settings.init(),
        authStep: AuthStepEnum.waitingForInput,
        authUserData: null,
      );

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}
