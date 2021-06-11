import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/auth/models/auth_provider_data.dart';
import 'package:redfire/auth/models/auth_user_data.dart';

class AuthUserDataExamples {
  static AuthUserData get minimal => AuthUserData(
      uid: 'uid',
      createdOn: DateTime.fromMillisecondsSinceEpoch(1607774920000),
      lastSignedInOn: DateTime.fromMillisecondsSinceEpoch(1607774928554),
      isAnonymous: false,
      emailVerified: false,
      providers: IList<AuthProviderData>());
}
