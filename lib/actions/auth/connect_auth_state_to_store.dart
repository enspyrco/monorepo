library connect_auth_state_to_store;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'connect_auth_state_to_store.g.dart';

abstract class ConnectAuthStateToStore extends Object
    with ReduxAction
    implements Built<ConnectAuthStateToStore, ConnectAuthStateToStoreBuilder> {
  ConnectAuthStateToStore._();

  factory ConnectAuthStateToStore() = _$ConnectAuthStateToStore._;

  Object? toJson() =>
      serializers.serializeWith(ConnectAuthStateToStore.serializer, this);

  static ConnectAuthStateToStore? fromJson(String jsonString) =>
      serializers.deserializeWith(
          ConnectAuthStateToStore.serializer, json.decode(jsonString));

  static Serializer<ConnectAuthStateToStore> get serializer =>
      _$connectAuthStateToStoreSerializer;

  @override
  String toString() => 'CONNECT_AUTH_STATE_TO_STORE';
}
