import 'package:json_types/json_types.dart';

import 'models/error_message.dart';

abstract class State {
  State copyWith();
  JsonMap toJson();
}

abstract class RootState extends State {
  List<ErrorMessage> errorMessages = [];
  @override
  RootState copyWith({List<ErrorMessage>? errorMessages});
}
