library observe_auth_state_action;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'observe_auth_state_action.g.dart';

abstract class ObserveAuthStateAction extends Object
    with ReduxAction
    implements Built<ObserveAuthStateAction, ObserveAuthStateActionBuilder> {
  ObserveAuthStateAction._();

  factory ObserveAuthStateAction() = _$ObserveAuthStateAction._;

  Object? toJson() =>
      serializers.serializeWith(ObserveAuthStateAction.serializer, this);

  static ObserveAuthStateAction? fromJson(String jsonString) =>
      serializers.deserializeWith(
          ObserveAuthStateAction.serializer, json.decode(jsonString));

  static Serializer<ObserveAuthStateAction> get serializer =>
      _$observeAuthStateActionSerializer;

  @override
  String toString() => 'CONNECT_AUTH_STATE_TO_STORE';
}
