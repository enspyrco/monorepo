import 'package:adventure_maker/_app/state/app_state.dart';
import 'package:adventure_maker/adventures/models/adventures_state.dart';
import 'package:adventure_maker/challenges/models/challenges_state.dart';
import 'package:adventure_maker/steps/models/steps_state.dart';
import 'package:adventure_maker/tasks/models/tasks_state.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:astro_types/auth_types.dart';

AppState defaultAppState = AppState(
  navigation: DefaultNavigationState.initial,
  auth: AuthStateTestDouble(
    user: UserAuthStateTestDouble(signedIn: SignedInState.checking),
  ),
  error: DefaultErrorHandlingState.initial,
  adventures: AdventuresState.initial,
  challenges: ChallengesState.initial,
  tasks: TasksState.initial,
  steps: StepsState.initial,
);

AppState signedInAppState = AppState(
  navigation: DefaultNavigationState.initial,
  auth: AuthStateTestDouble(
    user: UserAuthStateTestDouble(signedIn: SignedInState.signedIn, uid: 'uid'),
  ),
  error: DefaultErrorHandlingState.initial,
  adventures: AdventuresState.initial,
  challenges: ChallengesState.initial,
  tasks: TasksState.initial,
  steps: StepsState.initial,
);
