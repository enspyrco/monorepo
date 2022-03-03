import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:redfire/types.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

@GenerateMocks([
  GoogleSignIn,
  GoogleSignInAccount,
  SignInWithApple,
  SignInWithAppleWrapper
])
class AuthTestDoubles {}
