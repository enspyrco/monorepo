import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/serializers.dart';

part 'authorization_step.g.dart';

class AuthorizationStep extends EnumClass {
  static const AuthorizationStep waitingForInput = _$waitingForInput;
  static const AuthorizationStep gettingAuthorized = _$gettingAuthorized;
  static const AuthorizationStep authorized = _$authorized;

  const AuthorizationStep._(String name) : super(name);

  int get index => _$indexMap[this]!;
  static final _$indexMap = BuiltMap<AuthorizationStep, int>(
      {waitingForInput: 0, gettingAuthorized: 1, authorized: 2});

  static BuiltSet<AuthorizationStep> get values => _$values;
  static AuthorizationStep valueOf(String name) => _$valueOf(name);

  static Serializer<AuthorizationStep> get serializer =>
      _$authorizationStepSerializer;

  Object toJson() =>
      serializers.serializeWith(AuthorizationStep.serializer, this);
}
