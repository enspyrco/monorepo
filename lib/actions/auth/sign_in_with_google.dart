library sign_in_with_google;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/serializers.dart';

part 'sign_in_with_google.g.dart';

abstract class SignInWithGoogle extends Object
    with ReduxAction
    implements Built<SignInWithGoogle, SignInWithGoogleBuilder> {
  SignInWithGoogle._();

  factory SignInWithGoogle() = _$SignInWithGoogle._;

  Object toJson() =>
      serializers.serializeWith(SignInWithGoogle.serializer, this);

  static SignInWithGoogle fromJson(String jsonString) => serializers
      .deserializeWith(SignInWithGoogle.serializer, json.decode(jsonString));

  static Serializer<SignInWithGoogle> get serializer =>
      _$signInWithGoogleSerializer;

  @override
  String toString() => 'SIGN_IN_WITH_GOOGLE';
}
