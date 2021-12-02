import 'package:adventure_maker/models/adventure_model.dart';
import 'package:adventure_maker/models/challenge_model.dart';
import 'package:adventure_maker/models/step_model.dart';
import 'package:adventure_maker/models/task_model.dart';
import 'package:adventure_maker/state/adventures_state.dart';
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
    ChallengeModel? selectedChallenge,
    required ISet<ChallengeModel> challenges,
    TaskModel? selectedTask,
    required ISet<TaskModel> tasks,
    StepModel? selectedStep,
    required ISet<StepModel> steps,
  }) = _AppState;

  factory AppState.init() => AppState(
        /// RedFire init code
        auth: AuthState.init(),
        pages: <PageData>[const InitialPageData()].lock,
        problems: IList(),
        settings: Settings.init(),

        /// Additional init code
        adventures: AdventuresState.init(),
        challenges: ISet(),
        tasks: ISet(),
        steps: ISet(),
      );

  factory AppState.fromJson(JsonMap json) => _$AppStateFromJson(json);
}
