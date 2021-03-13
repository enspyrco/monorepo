import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/utils/serializers.dart';

part 'nav_selection.g.dart';

class NavSelection extends EnumClass {
  static Serializer<NavSelection> get serializer => _$navSelectionSerializer;
  static const NavSelection local = _$local;
  static const NavSelection github = _$github;
  static const NavSelection profile = _$profile;

  static const Map<NavSelection, int> _$indexMap = {
    local: 0,
    github: 1,
    profile: 2,
  };

  const NavSelection._(String name) : super(name);

  int get index => _$indexMap[this] ?? 0;
  static BuiltSet<NavSelection> get values => _$values;
  static NavSelection valueOf(String name) => _$valueOf(name);

  static NavSelection valueOfIndex(int index) {
    switch (index) {
      case 0:
        return _$local;
      case 1:
        return _$github;
      case 2:
        return _$profile;
      default:
        throw ArgumentError(index);
    }
  }

  Object? toJson() => serializers.serializeWith(NavSelection.serializer, this);
}
