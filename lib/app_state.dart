import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/auth/enums/auth_step_enum.dart';
import 'package:redfire/auth/models/auth_user_data.dart';
import 'package:redfire/problems/models/problem_info.dart';
import 'package:redfire/settings/models/settings.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

abstract class RedFireState {
  IList<ProblemInfo> get problems;
  Settings get settings;
  AuthStepEnum get authStep;
  AuthUserData? get authUserData;

  RedFireState.init();
}

@freezed
class AppState with _$AppState {
  @Implements(RedFireState)
  factory AppState({
    required IList<ProblemInfo> problems,
    required Settings settings,
    required AuthStepEnum authStep,
    required AuthUserData? authUserData,
  }) = _AppState;

  factory AppState.init() => AppState(
        problems: IList(),
        settings: Settings.init(),
        authStep: AuthStepEnum.waitingForInput,
        authUserData: null,
      );

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}
