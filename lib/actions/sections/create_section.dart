library create_section;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/serializers.dart';

part 'create_section.g.dart';

abstract class CreateSection extends Object
    with ReduxAction
    implements Built<CreateSection, CreateSectionBuilder> {
  CreateSection._();

  factory CreateSection() = _$CreateSection._;

  Object toJson() => serializers.serializeWith(CreateSection.serializer, this);

  // static CreateSection fromJson(String jsonString) => serializers
  //     .deserializeWith(CreateSection.serializer, json.decode(jsonString));

  static Serializer<CreateSection> get serializer => _$createSectionSerializer;

  @override
  String toString() => 'CREATE_SECTION';
}
