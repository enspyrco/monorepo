import 'typedefs.dart';

abstract class ReduxState {
  JsonMap toJson();
  String get typeName;
}
