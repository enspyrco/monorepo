import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

/// Class for carrying basic error information for display to the user.
class DefaultErrorReport implements ErrorReport, AstroState {
  const DefaultErrorReport({
    required this.message,
    this.settings = ErrorReportSettings.fullReport,
    this.trace,
    this.details,
  });

  @override
  final String message;
  @override
  final String? trace;
  @override
  final Map<String, String>? details;
  @override
  final ErrorReportSettings settings;

  @override
  DefaultErrorReport copyWith(
          {String? message, String? trace, ErrorReportSettings? settings}) =>
      DefaultErrorReport(
        message: message ?? this.message,
        trace: trace ?? this.trace,
        settings: settings ?? this.settings,
      );

  @override
  JsonMap toJson() => <String, dynamic>{
        'message': message,
        'trace': trace,
        'settings': settings,
      };

  @override
  bool operator ==(Object other) =>
      other is DefaultErrorReport &&
      other.message == message &&
      other.trace == trace &&
      other.settings == settings;

  @override
  int get hashCode => Object.hash(message, trace, settings);
}
