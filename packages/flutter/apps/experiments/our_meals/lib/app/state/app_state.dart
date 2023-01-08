import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/astro_annotations.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

part 'app_state.g.dart';

@GeneratedImplementation()
abstract class AppState
    implements
        AstroState,
        AppStateNavigation,
        AppStateErrorHandling,
        AppStateAuth {
  factory AppState.initialValue() => GeneratedAppState(
        auth: AstroAuth.initialState(),
        error: DefaultErrorHandlingState.initial,
        navigation: DefaultNavigationState.initial,
      );

  @override
  AppState copyWith({
    NavigationState? navigation,
    ErrorHandlingState? error,
    AuthState? auth,
  });
}
