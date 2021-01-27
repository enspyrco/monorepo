import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/serializers.dart';

part 'provider_name.g.dart';

class ProviderName extends EnumClass {
  static const ProviderName google = _$google;
  static const ProviderName asana = _$asana;

  const ProviderName._(String name) : super(name);

  int get index => _$indexMap[this]!;
  static final _$indexMap = BuiltMap<ProviderName, int>({google: 0, asana: 1});

  static BuiltSet<ProviderName> get values => _$values;
  static ProviderName valueOf(String name) => _$valueOf(name);

  static Serializer<ProviderName> get serializer => _$providerNameSerializer;

  Object toJson() => serializers.serializeWith(ProviderName.serializer, this);
}
