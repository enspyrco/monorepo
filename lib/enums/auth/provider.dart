import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/serializers.dart';

part 'provider.g.dart';

class Provider extends EnumClass {
  static const Provider google = _$google;
  static const Provider asana = _$asana;

  const Provider._(String name) : super(name);

  int get index => _$indexMap[this]!;
  static final _$indexMap = BuiltMap<Provider, int>({google: 0, asana: 1});

  static BuiltSet<Provider> get values => _$values;
  static Provider valueOf(String name) => _$valueOf(name);

  static Serializer<Provider> get serializer => _$providerSerializer;

  Object toJson() => serializers.serializeWith(Provider.serializer, this);
}
