import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

/// Class for carrying basic error information for display to the user.
class ExampleErrorMessage with AstroState {
  ExampleErrorMessage({required this.message, this.trace});

  final String message;

  final String? trace;

  @override
  ExampleErrorMessage copyWith({String? message, String? trace}) =>
      ExampleErrorMessage(
          message: message ?? this.message, trace: trace ?? this.trace);

  @override
  JsonMap toJson() => <String, dynamic>{'message': message, 'trace': trace};
}
