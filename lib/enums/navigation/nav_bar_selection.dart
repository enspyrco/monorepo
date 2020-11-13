import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/serializers.dart';

part 'nav_bar_selection.g.dart';

class NavBarSelection extends EnumClass {
  static const NavBarSelection projects = _$projects;
  static const NavBarSelection topics = _$topics;
  static const NavBarSelection profile = _$profile;

  const NavBarSelection._(String name) : super(name);

  int get index => _$indexMap[this];
  static const Map<NavBarSelection, int> _$indexMap = {
    projects: 0,
    topics: 1,
    profile: 2,
  };

  static BuiltSet<NavBarSelection> get values => _$values;
  static NavBarSelection valueOf(String name) => _$valueOf(name);

  static Serializer<NavBarSelection> get serializer =>
      _$navBarSelectionSerializer;

  Object toJson() =>
      serializers.serializeWith(NavBarSelection.serializer, this);
}
