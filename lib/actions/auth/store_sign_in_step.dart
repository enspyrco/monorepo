library store_sign_in_step;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:flireator/utils/serializers.dart';

part 'store_sign_in_step.g.dart';

abstract class StoreSignInStep extends Object
    with ReduxAction
    implements Built<StoreSignInStep, StoreSignInStepBuilder> {
  SignInStep get step;

  StoreSignInStep._();

  factory StoreSignInStep({SignInStep step}) = _$StoreSignInStep._;

  Object toJson() =>
      serializers.serializeWith(StoreSignInStep.serializer, this);

  static StoreSignInStep fromJson(String jsonString) => serializers
      .deserializeWith(StoreSignInStep.serializer, json.decode(jsonString));

  static Serializer<StoreSignInStep> get serializer =>
      _$storeSignInStepSerializer;

  @override
  String toString() => 'STORE_SIGN_IN_STEP: $step';
}
