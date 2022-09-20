import 'package:json_types/json_types.dart';

import '../state.dart';

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
