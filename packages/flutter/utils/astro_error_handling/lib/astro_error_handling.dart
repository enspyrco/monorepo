library astro_error_handling;

import 'package:astro_error_handling_interface/astro_error_handling_interface.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:json_types/json_types.dart';

class ErrorHandlers with BaseErrorHandlers {
  @override
  AstroState handleLandingError(AstroState state) {
    return state;
  }

  @override
  AstroState handleLaunchError(AstroState state) {
    return state;
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
