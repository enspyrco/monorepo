library launch_url;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/serializers.dart';

part 'launch_url.g.dart';

abstract class LaunchUrl extends Object
    with ReduxAction
    implements Built<LaunchUrl, LaunchUrlBuilder> {
  String get url;

  LaunchUrl._();

  factory LaunchUrl({required String url}) = _$LaunchUrl._;

  factory LaunchUrl.by([void Function(LaunchUrlBuilder) updates]) = _$LaunchUrl;

  Object toJson() => serializers.serializeWith(LaunchUrl.serializer, this);

  // static LaunchUrl fromJson(String jsonString) => serializers.deserializeWith(
  //     LaunchUrl.serializer, json.decode(jsonString));

  static Serializer<LaunchUrl> get serializer => _$launchUrlSerializer;

  @override
  String toString() => 'LAUNCH_URL';
}
