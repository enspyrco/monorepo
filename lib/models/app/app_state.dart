import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:flireator/models/app/settings.dart';
import 'package:flireator/models/auth/auth_data.dart';
import 'package:flireator/models/flireator/flireator.dart';
import 'package:flireator/models/problems/problem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    /// Problems
    required IList<Problem> problems,
    Problem? displayProblem,

    /// Settings
    required Settings settings,

    /// Auth
    required SignInStep signInStep,
    AuthData? authData,

    /// Flireator
    Flireator? flireator,

    /// GitHub
    String? gitHubToken,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.init() => AppState(
      problems: IList<Problem>(),
      signInStep: SignInStep.checking,
      settings: Settings.init());
}
