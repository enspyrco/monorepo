import 'package:redfire/types.dart';

abstract class ReduxAction {
  JsonMap toJson();
  String get typeName;
}
