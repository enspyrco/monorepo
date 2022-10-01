library astro_error_handling;

import 'package:astro_error_handling_interface/astro_error_handling_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:json_types/json_types.dart';

/// TODO: We need a type for [state] that has [copyWith(errorMessages: ...]
/// and as [extends AstroState]
///
/// TODO: We need the types for AwayMission & LandingMission
/// - make an interface package?
///
class ErrorHandlers<S extends AstroState> with BaseErrorHandlers<S> {
  @override
  S handleLandingError(
      {required Object thrown,
      required StackTrace trace,
      required dynamic mission,
      required S state}) {
    return (state as dynamic).copyWith(errorMessages: [
      ErrorMessage(
          message: 'Landing $mission, resulted in $thrown', trace: '$trace'),
      ...(state as ErrorHandlingState).errorMessages
    ]) as S; // TODO: avoid dynamic dispatch
  }

  @override
  AstroState handleLaunchError(
      {required Object thrown,
      required StackTrace trace,
      required dynamic mission,
      required S state}) {
    return (state as dynamic).copyWith(errorMessages: [
      ErrorMessage(
          message: 'Launching $mission, resulted in $thrown', trace: '$trace'),
      ...(state as ErrorHandlingState).errorMessages
    ]) as S; // TODO: avoid dynamic dispatch
  }
}

/// Class for carrying basic error information for display to the user.
class ErrorMessage with AstroState {
  ErrorMessage({required this.message, this.trace});

  final String message;

  final String? trace;

  @override
  ErrorMessage copyWith({String? message, String? trace}) => ErrorMessage(
      message: message ?? this.message, trace: trace ?? this.trace);

  @override
  JsonMap toJson() => <String, dynamic>{'message': message, 'trace': trace};
}

mixin ErrorHandlingState {
  abstract final List<ErrorMessage> errorMessages;
}

abstract class Blah with AstroState, ErrorHandlingState {}
