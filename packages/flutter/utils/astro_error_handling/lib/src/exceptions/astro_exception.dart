import 'package:astro_types/error_handling_types.dart';

/// [AstroException] has members for message and reportSettings so
/// that anyone can easily create an exception that configures the resulting
/// error message in different ways.
class AstroException implements Exception {
  const AstroException(
      {this.reportSettings = ErrorReportSettings.fullReport,
      required this.message});

  final String message;
  final ErrorReportSettings reportSettings;
}

// AstroInfoException is set to configure the displayed error message to just
// display the message with no stack trace or mission details. This is
// intended to be used for things like incorrect (but expected) user input
// where we want to give the user info about what happened but not details
// like the stack trace that look like a crash.
class AstroInfoException extends AstroException {
  const AstroInfoException({required super.message});

  @override
  ErrorReportSettings get reportSettings => ErrorReportSettings.infoMessage;
}
