import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/auth/enums/auth_step_enum.dart';
import 'package:redfire/src/auth/models/auth_state.dart';
import 'package:redfire/src/navigation/models/red_fire_page.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/settings/models/settings.dart';
import 'package:redfire/src/types/red_fire_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    required IList<RedFirePage> redFirePages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    required AuthState auth,
  }) = _AppState;

  factory AppState.init() => AppState(
        redFirePages: <RedFirePage>[RedFireInitialPage()].lock,
        problems: IList(),
        settings: Settings.init(),
        auth: AuthState(step: AuthStepEnum.waitingForInput),
      );

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}
