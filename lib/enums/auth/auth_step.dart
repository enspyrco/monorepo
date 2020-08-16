import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/utils/serializers.dart';

part 'auth_step.g.dart';

class AuthStep extends EnumClass {
  static Serializer<AuthStep> get serializer => _$authStepSerializer;
  static const AuthStep checking = _$checking;
  static const AuthStep waitingForInput = _$waitingForInput;
  static const AuthStep signingInWithApple = _$signingInWithApple;
  static const AuthStep retrievingStoredToken = _$retrievingStoredToken;

  static const AuthStep requestingGitHubAuth = _$requestingGitHubAuth;
  static const AuthStep exchangingCode = _$exchangingCode;
  static const AuthStep exchangedCode = _$exchangedCode;
  static const AuthStep signingInWithGitHub = _$signingInWithGitHub;
  static const AuthStep signingOut = _$signingOut;

  static const Map<AuthStep, int> _$indexMap = {
    checking: 0,
    signingInWithApple: 1,
    retrievingStoredToken: 2,
    waitingForInput: 3,
    requestingGitHubAuth: 4,
    exchangingCode: 5,
    exchangedCode: 6,
    signingInWithGitHub: 7,
    signingOut: 8
  };

  const AuthStep._(String name) : super(name);

  int get index => _$indexMap[this];
  static BuiltSet<AuthStep> get values => _$values;
  static AuthStep valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(AuthStep.serializer, this);
}
