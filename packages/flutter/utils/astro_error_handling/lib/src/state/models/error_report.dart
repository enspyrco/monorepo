import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

/// Class for carrying basic error information for display to the user.
class DefaultErrorReport implements ErrorReport, AstroState {
  const DefaultErrorReport({required this.message, this.trace});

  @override
  final String message;
  @override
  final String? trace;

  @override
  DefaultErrorReport copyWith({String? message, String? trace}) =>
      DefaultErrorReport(
          message: message ?? this.message, trace: trace ?? this.trace);

  @override
  JsonMap toJson() => <String, dynamic>{'message': message, 'trace': trace};

  @override
  bool operator ==(Object other) =>
      other is ErrorReport && other.message == message && other.trace == trace;

  @override
  int get hashCode => Object.hash(message, trace);
}
