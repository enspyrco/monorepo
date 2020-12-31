library get_authorized;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/enums/auth/provider.dart';
import 'package:the_process/serializers.dart';

part 'get_authorized.g.dart';

abstract class GetAuthorized extends Object
    with ReduxAction
    implements Built<GetAuthorized, GetAuthorizedBuilder> {
  Provider get toAccess;

  GetAuthorized._();

  factory GetAuthorized({required Provider toAccess}) = _$GetAuthorized._;

  factory GetAuthorized.by([void Function(GetAuthorizedBuilder) updates]) =
      _$GetAuthorized;

  Object toJson() => serializers.serializeWith(GetAuthorized.serializer, this);

  // static GetAuthorized fromJson(String jsonString) => serializers
  //     .deserializeWith(GetAuthorized.serializer, json.decode(jsonString));

  static Serializer<GetAuthorized> get serializer => _$getAuthorizedSerializer;

  @override
  String toString() => 'GET_AUTHORIZED';
}
