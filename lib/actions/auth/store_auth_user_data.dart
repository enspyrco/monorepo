library store_auth_user_data;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/auth/auth_user_data.dart';
import 'package:the_process/serializers.dart';

part 'store_auth_user_data.g.dart';

abstract class StoreAuthUserData extends Object
    with ReduxAction
    implements Built<StoreAuthUserData, StoreAuthUserDataBuilder> {
  AuthUserData? get authUserData;

  StoreAuthUserData._();

  factory StoreAuthUserData({required AuthUserData? authUserData}) =
      _$StoreAuthUserData._;

  factory StoreAuthUserData.by(
      [void Function(StoreAuthUserDataBuilder) updates]) = _$StoreAuthUserData;

  Object toJson() =>
      serializers.serializeWith(StoreAuthUserData.serializer, this);

  // static StoreAuthUserData fromJson(String jsonString) => serializers
  //     .deserializeWith(StoreAuthUserData.serializer, json.decode(jsonString));

  static Serializer<StoreAuthUserData> get serializer =>
      _$storeAuthUserDataSerializer;

  @override
  String toString() {
    var userDataSummary = '-';

    // Use a local variable to get type promotion
    final authUserDataLocal = authUserData;

    if (authUserDataLocal == null) {
      return 'STORE_USER_DATA: null';
    }

    if (authUserDataLocal.isAnonymous) {
      userDataSummary = 'anon-${authUserDataLocal.uid.substring(0, 4)}...';
    } else {
      userDataSummary = '${authUserDataLocal.uid.substring(0, 4)}...';
    }

    return 'STORE_USER_DATA: $userDataSummary';
  }
}
