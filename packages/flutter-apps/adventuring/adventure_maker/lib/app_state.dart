import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'adventures/models/adventures_state.dart';
import 'challenges/models/challenges_state.dart';
import 'steps/models/steps_state.dart';
import 'tasks/models/tasks_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    /// RedFire AppState members
    required AuthState auth,
    @PageDataConverter() required IList<PageData> pages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    ProfileData? profile,

    /// Additional AppState members
    required AdventuresState adventures,
    required ChallengesState challenges,
    required TasksState tasks,
    required StepsState steps,
  }) = _AppState;

  factory AppState.init() => AppState(
        /// RedFire init code
        auth: AuthState.init(),
        pages: <PageData>[const InitialPageData()].lock,
        problems: IList(),
        settings: Settings.init(),

        /// Additional init code
        adventures: AdventuresState.init(),
        challenges: ChallengesState.init(),
        tasks: TasksState.init(),
        steps: StepsState.init(),
      );

  factory AppState.fromJson(JsonMap json) => _$AppStateFromJson(json);
}
