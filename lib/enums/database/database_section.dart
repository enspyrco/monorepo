import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/serializers.dart';

part 'database_section.g.dart';

class DatabaseSection extends EnumClass {
  static const DatabaseSection profileData = _$profileData;
  static const DatabaseSection newEntries = _$newEntries;
  static const DatabaseSection sections = _$sections;

  static const Map<DatabaseSection, int> _$indexMap = {
    profileData: 0,
    newEntries: 1,
    sections: 2
  };

  const DatabaseSection._(String name) : super(name);

  int get index => _$indexMap[this]!;

  static BuiltSet<DatabaseSection> get values => _$values;
  static DatabaseSection valueOf(String name) => _$valueOf(name);

  static Serializer<DatabaseSection> get serializer =>
      _$databaseSectionSerializer;

  Object toJson() =>
      serializers.serializeWith(DatabaseSection.serializer, this);
}
