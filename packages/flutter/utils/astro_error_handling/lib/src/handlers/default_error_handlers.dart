import 'package:astro_types/core_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/state_types.dart';

import '../models/error_handling_state.dart';
import '../models/error_report.dart';

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
      ...(state as ErrorHandlingState).reports
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
      ...(state as ErrorHandlingState).reports
    ]) as S; // TODO: avoid dynamic dispatch
  }
}
