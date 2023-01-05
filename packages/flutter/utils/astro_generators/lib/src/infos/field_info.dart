class FieldInfo {
  FieldInfo(this.type, this.name);

  final String type;
  final String name;

  @override
  String toString() => 'type: $type, name: $name';
}
