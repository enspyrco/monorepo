library update_settings;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/enums/platform/platform_enum.dart';
import 'package:the_process/serializers.dart';

part 'update_settings.g.dart';

abstract class UpdateSettings extends Object
    with ReduxAction
    implements Built<UpdateSettings, UpdateSettingsBuilder> {
  PlatformEnum get platform;

  UpdateSettings._();

  factory UpdateSettings({@required PlatformEnum platform}) =
      _$UpdateSettings._;

  factory UpdateSettings.by([void Function(UpdateSettingsBuilder) updates]) =
      _$UpdateSettings;

  Object toJson() => serializers.serializeWith(UpdateSettings.serializer, this);

  static UpdateSettings fromJson(String jsonString) => serializers
      .deserializeWith(UpdateSettings.serializer, json.decode(jsonString));

  static Serializer<UpdateSettings> get serializer =>
      _$updateSettingsSerializer;

  @override
  String toString() => 'UPDATE_SETTINGS';
}
