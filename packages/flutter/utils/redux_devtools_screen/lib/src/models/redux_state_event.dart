import 'package:json_utils/json_utils.dart';

class ReduxStateEvent {
  ReduxStateEvent({required this.data, required this.type});

  final JsonMap data;
  final String type;
}
