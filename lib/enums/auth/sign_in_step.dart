import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/utils/serializers.dart';

part 'sign_in_step.g.dart';

class SignInStep extends EnumClass {
  static Serializer<SignInStep> get serializer => _$signInStepSerializer;
  static const SignInStep checking = _$checking;
  static const SignInStep waitingForInput = _$waitingForInput;
  static const SignInStep signingInWithApple = _$signingInWithApple;
  static const SignInStep signingInWithFirebase = _$signingInWithFirebase;
  static const SignInStep retrievingFlireatorData = _$retrievingFlireatorData;
  static const SignInStep signingOut = _$signingOut;

  static const Map<SignInStep, int> _$indexMap = {
    checking: 0,
    waitingForInput: 1,
    signingInWithApple: 2,
    signingInWithFirebase: 3,
    retrievingFlireatorData: 4,
    signingOut: 5
  };

  const SignInStep._(String name) : super(name);

  int get index => _$indexMap[this] ?? 0;
  static BuiltSet<SignInStep> get values => _$values;
  static SignInStep valueOf(String name) => _$valueOf(name);

  Object? toJson() => serializers.serializeWith(SignInStep.serializer, this);
}
