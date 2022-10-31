import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

/// Class for carrying basic error information for display to the user.
class ErrorReport implements AstroState {
  const ErrorReport({required this.message, this.trace});

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
