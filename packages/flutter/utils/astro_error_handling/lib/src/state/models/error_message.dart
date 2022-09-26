import 'package:astro/astro.dart';
import 'package:json_types/json_types.dart';

/// Class for carrying basic error information for display to the user.
class ErrorMessage extends State {
  ErrorMessage({required this.message, required this.trace});
  final String message;
  final String trace;

  @override
  ErrorMessage copyWith({String? message, String? trace}) => ErrorMessage(
      message: message ?? this.message, trace: trace ?? this.trace);

  @override
  JsonMap toJson() => <String, dynamic>{'message': message, 'trace': trace};
}
