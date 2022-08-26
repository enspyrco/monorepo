import 'package:json_types/json_types.dart';

class ReduxStateEvent {
  ReduxStateEvent({required this.data, required this.type});

  final JsonMap data;
  final String type;
}
