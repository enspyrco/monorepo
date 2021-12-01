import 'package:adventure_maker/models/adventure_model.dart';
import 'package:adventure_maker/models/challenge_model.dart';
import 'package:adventure_maker/models/step_model.dart';
import 'package:adventure_maker/models/task_model.dart';
import 'package:adventure_maker/pages/main_page.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';

part 'main.freezed.dart';
part 'main.g.dart';

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
    AdventureModel? selectedAdventure,
    ChallengeModel? selectedChallenge,
    TaskModel? selectedTask,
    StepModel? selectedStep,
  }) = _AppState;

  factory AppState.init() => AppState(
        /// RedFire init code
        auth: AuthState.init(),
        pages: <PageData>[const InitialPageData()].lock,
        problems: IList(),
        settings: Settings.init(),

        /// Additional init code
      );

  factory AppState.fromJson(JsonMap json) => _$AppStateFromJson(json);
}

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: const [],
      middlewares: const [],
      reducers: const [],
      pageTransforms: const [],
      title: 'adventure_maker', // optional, defaults to 'Title Note Set'
      mainPage: const MainPage(),
    ));
