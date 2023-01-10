import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../../models/class_box.dart';
import '../../models/domain_object.dart';

class AppState
    implements
        AstroState,
        AppStateErrorHandling,
        AppStateNavigation,
        AppStateAuth {
  AppState({
    required this.navigation,
    required this.auth,
    required this.error,
    required this.classBoxes,
    required this.domainObjects,
  });

  @override
  final DefaultNavigationState navigation;

  @override
  final AuthState auth;

  @override
  final DefaultErrorHandlingState error;

  final Set<ClassBox> classBoxes;
  final Set<DomainObject> domainObjects;

  static AppState get initial => AppState(
        navigation: DefaultNavigationState.initial,
        auth: AstroAuth.initialState(),
        error: DefaultErrorHandlingState.initial,
        classBoxes: <ClassBox>{},
        domainObjects: <DomainObject>{},
      );

  @override
  AppState copyWith({
    DefaultNavigationState? navigation,
    DefaultErrorHandlingState? error,
    AuthState? auth,
    Set<ClassBox>? classBoxes,
    Set<DomainObject>? domainObjects,
  }) =>
      AppState(
        navigation: navigation ?? this.navigation,
        auth: auth ?? this.auth,
        error: error ?? this.error,
        classBoxes: classBoxes ?? this.classBoxes,
        domainObjects: domainObjects ?? this.domainObjects,
      );

  @override
  toJson() => {
        'navigation': navigation.toJson(),
        'auth': auth.toJson(),
        'error': error.toJson(),
        'classBoxes': [for (var box in classBoxes) box.toJson()],
        'domainObjects': [for (var object in domainObjects) object.toJson()],
      };
}
