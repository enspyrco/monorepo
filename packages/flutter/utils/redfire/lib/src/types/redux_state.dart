import 'package:json_types/json_types.dart';

abstract class ReduxState {
  JsonMap toJson();
  String get typeName;
}
