import 'package:the_process/models/auth/auth_user_data.dart';
import 'package:the_process/utils/immutable_collections/immutable_list.dart';

class AuthUserDataExamples {
  static AuthUserData get minimal => AuthUserData(
      uid: 'uid',
      createdOn: DateTime.fromMillisecondsSinceEpoch(1607774920000),
      lastSignedInOn: DateTime.fromMillisecondsSinceEpoch(1607774928554),
      isAnonymous: false,
      emailVerified: false,
      providers: ImmutableList());
}
