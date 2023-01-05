import 'field_info.dart';

class InterfaceInfo {
  InterfaceInfo(this.name, this.fields);

  String name;
  List<FieldInfo> fields;

  @override
  String toString() => 'name: $name, fields: ${[...fields]}';
}
