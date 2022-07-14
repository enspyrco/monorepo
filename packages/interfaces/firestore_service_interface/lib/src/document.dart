import 'package:json_utils/json_utils.dart';

/// Design decisions
///  - the benefit of having createTime and updateTime already converted is less
///    than the cost of converting every time (so they are left as String)
///  - the converse for id, the benefit of having id already extracted from name
///     outweighs the cost of doing it every time
abstract class Document {
  String get id;
  String get name;
  JsonMap get fields;
  String get createTime;
  String get updateTime;
}
