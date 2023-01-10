class FieldInfo {
  FieldInfo({
    required this.typeName,
    required this.typeNameWithoutNullability,
    required this.hasNullableType,
    required this.name,
  });

  final String typeName;
  final String typeNameWithoutNullability;
  final bool hasNullableType;
  final String name;

  @override
  String toString() => 'type: $typeName, name: $name';
}
