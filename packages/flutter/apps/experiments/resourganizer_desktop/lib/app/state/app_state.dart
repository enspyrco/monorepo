import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/state_types.dart';

class AppState
    with
        AstroState,
        DefaultErrorHandlingState,
        DefaultAuthState,
        DefaultNavigationState {
  AppState(
      {required this.reports, required this.user, required this.navigation});

  static AppState get initial => AppState(
      reports: const [],
      user: UserState(signedIn: SignedInState.checking),
      navigation: NavigationState.initial);

  @override
  final UserState user;

  @override
  final List<ErrorReport> reports;

  @override
  final NavigationState navigation;

  @override
  AppState copyWith({
    List<ErrorReport>? reports,
    UserState? user,
    NavigationState? navigation,
  }) {
    return AppState(
      reports: reports ?? this.reports,
      user: user ?? this.user,
      navigation: navigation ?? this.navigation,
    );
  }

  @override
  toJson() => {
        'user': user.toJson(),
        'reports': reports.map((e) => e.toJson()).toList(),
        'navigation': navigation.toJson(),
      };
}
