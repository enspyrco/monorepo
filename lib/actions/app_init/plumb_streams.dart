library plumb_streams;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/serializers.dart';

part 'plumb_streams.g.dart';

abstract class PlumbStreams extends Object
    with ReduxAction
    implements Built<PlumbStreams, PlumbStreamsBuilder> {
  PlumbStreams._();

  factory PlumbStreams() = _$PlumbStreams._;

  Object toJson() => serializers.serializeWith(PlumbStreams.serializer, this);

  // static PlumbStreams fromJson(String jsonString) => serializers
  //     .deserializeWith(PlumbStreams.serializer, json.decode(jsonString));

  static Serializer<PlumbStreams> get serializer => _$plumbStreamsSerializer;

  @override
  String toString() => 'PLUMB_STREAMS';
}
