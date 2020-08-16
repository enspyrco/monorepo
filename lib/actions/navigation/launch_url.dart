library launch_url;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';
import 'package:meta/meta.dart';

part 'launch_url.g.dart';

abstract class LaunchURL extends Object
    with ReduxAction
    implements Built<LaunchURL, LaunchURLBuilder> {
  String get url;

  LaunchURL._();

  factory LaunchURL({@required String url}) = _$LaunchURL._;

  Object toJson() => serializers.serializeWith(LaunchURL.serializer, this);

  static LaunchURL fromJson(String jsonString) => serializers.deserializeWith(
      LaunchURL.serializer, json.decode(jsonString));

  static Serializer<LaunchURL> get serializer => _$launchURLSerializer;

  @override
  String toString() => 'LAUNCH_URL';
}
