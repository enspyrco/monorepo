library store_nav_selection;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/enums/navigation/nav_selection.dart';
import 'package:flireator/utils/serializers.dart';

part 'store_nav_selection.g.dart';

abstract class StoreNavSelection extends Object
    with ReduxAction
    implements Built<StoreNavSelection, StoreNavSelectionBuilder> {
  NavSelection get selection;

  StoreNavSelection._();

  factory StoreNavSelection({required NavSelection selection}) =
      _$StoreNavSelection._;

  factory StoreNavSelection.by(
      [void Function(StoreNavSelectionBuilder) updates]) = _$StoreNavSelection;

  Object? toJson() =>
      serializers.serializeWith(StoreNavSelection.serializer, this);

  static StoreNavSelection? fromJson(String jsonString) => serializers
      .deserializeWith(StoreNavSelection.serializer, json.decode(jsonString));

  static Serializer<StoreNavSelection> get serializer =>
      _$storeNavSelectionSerializer;

  @override
  String toString() => 'STORE_NAV_SELECTION';
}
