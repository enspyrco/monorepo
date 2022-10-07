library astro_error_handling;

import 'package:astro_core_interface/astro_core_interface.dart';
import 'package:astro_error_handling_interface/astro_error_handling_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:json_types/json_types.dart';

/// TODO: We need a type for [state] that has [copyWith(errorMessages: ...]
/// and as [extends AstroState]
///
class DefaultErrorHandlers<S extends AstroState> with ErrorHandlers<S> {
  @override
  S handleLandingError(
      {required Object thrown,
      required StackTrace trace,
      required LandingMission mission,
      required S state}) {
    return (state as dynamic).copyWith(errorMessages: [
      ErrorReport(
          message: 'Landing $mission, resulted in $thrown', trace: '$trace'),
      ...(state as ErrorHandlingState).errorMessages
    ]) as S; // TODO: avoid dynamic dispatch
  }

  @override
  AstroState handleLaunchError(
      {required Object thrown,
      required StackTrace trace,
      required AwayMission mission,
      required S state}) {
    return (state as dynamic).copyWith(errorMessages: [
      ErrorReport(
          message: 'Launching $mission, resulted in $thrown', trace: '$trace'),
      ...(state as ErrorHandlingState).errorMessages
    ]) as S; // TODO: avoid dynamic dispatch
  }
}

/// Class for carrying basic error information for display to the user.
class ErrorReport with AstroState {
  ErrorReport({required this.message, this.trace});

  final String message;

  final String? trace;

  @override
  ErrorReport copyWith({String? message, String? trace}) =>
      ErrorReport(message: message ?? this.message, trace: trace ?? this.trace);

  @override
  JsonMap toJson() => <String, dynamic>{'message': message, 'trace': trace};
}

mixin ErrorHandlingState {
  abstract final List<ErrorReport> errorMessages;
}
