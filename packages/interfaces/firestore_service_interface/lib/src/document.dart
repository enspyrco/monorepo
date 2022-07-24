import 'package:json_utils/json_utils.dart';

/// Design decisions
///  - the benefit of having createTime and updateTime already converted is less
///    than the cost of converting every time (so they are left as String)
///  - the converse for id, the benefit of having id already extracted from name
///     outweighs the cost of doing it every time
class Document {
  Document(
      {required this.id,
      required this.path,
      required this.fields,
      this.createTime,
      this.updateTime});
  final String id;

  /// cloud_firestore: we use reference.path
  /// googleapis: we get the path from the name
  final String path;
  final JsonMap fields;

  /// googleapis: always present
  /// cloud_firestore: not accessible so always null
  final String? createTime;

  /// googleapis: always present
  /// cloud_firestore: not accessible so always null
  final String? updateTime;
}
