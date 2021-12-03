import 'typedefs.dart';

abstract class ReduxModel {
  JsonMap toJson();
  String get typeName;
}
