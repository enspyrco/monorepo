import 'package:adventure_maker/adventures/models/adventures_state.dart';
import 'package:adventure_maker/challenges/models/challenges_state.dart';
import 'package:adventure_maker/steps/models/steps_state.dart';
import 'package:adventure_maker/tasks/models/tasks_state.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

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
