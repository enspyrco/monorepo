library astro_error_handling;

import 'package:astro_types/core_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

/// TODO: We need a type for [state] that has [copyWith(reports: ...]
/// and as [extends AstroState]
///
class DefaultErrorHandlers<S extends AstroState> with ErrorHandlers<S> {
  @override
  S handleLandingError(
      {required Object thrown,
      required StackTrace trace,
      required LandingMission mission,
      required S state}) {
    return (state as dynamic).copyWith(reports: [
      ErrorReport(
          message: 'Landing $mission, resulted in $thrown', trace: '$trace'),
      ...(state as DefaultErrorHandlingState).reports
    ]) as S; // TODO: avoid dynamic dispatch
  }

  @override
  AstroState handleLaunchError(
      {required Object thrown,
      required StackTrace trace,
      required AwayMission mission,
      required S state}) {
    return (state as dynamic).copyWith(reports: [
      ErrorReport(
          message: 'Launching $mission, resulted in $thrown', trace: '$trace'),
      ...(state as DefaultErrorHandlingState).reports
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

  @override
  bool operator ==(Object other) =>
      other is ErrorReport && other.message == message && other.trace == trace;

  @override
  int get hashCode => Object.hash(message, trace);
}

mixin DefaultErrorHandlingState {
  abstract final List<ErrorReport> reports;
}
