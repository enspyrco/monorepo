import 'package:built_collection/built_collection.dart';
import 'package:the_process/models/auth/auth_user_data.dart';

class AuthUserDataExample {
  static AuthUserData get minimal => AuthUserData(
      uid: 'uid',
      createdOn: DateTime.fromMillisecondsSinceEpoch(1607774920000),
      lastSignedInOn: DateTime.fromMillisecondsSinceEpoch(1607774928554),
      isAnonymous: false,
      emailVerified: false,
      providers: BuiltList());
}
