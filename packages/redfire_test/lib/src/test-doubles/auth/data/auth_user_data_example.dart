import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/types.dart';

class AuthUserDataExample {
  static AuthUserData get minimal => AuthUserData(
      uid: 'uid',
      createdOn: DateTime.fromMillisecondsSinceEpoch(1607774920000),
      lastSignedInOn: DateTime.fromMillisecondsSinceEpoch(1607774928554),
      isAnonymous: false,
      emailVerified: false,
      providers: IList<AuthProviderData>());

  static AuthUserData get basic => AuthUserData(
      uid: 'uid',
      displayName: 'displayName',
      photoURL: 'photoURL',
      email: 'email',
      emailVerified: false,
      isAnonymous: false,
      providers: IList<AuthProviderData>());

  // normal data with a single provider
  static AuthUserData get normal => AuthUserData(
      uid: 'uid',
      displayName: 'andy',
      photoURL: 'url',
      email: 'email@email.email',
      phoneNumber: '0423123421',
      createdOn: DateTime.now(),
      lastSignedInOn: DateTime.now(),
      isAnonymous: false,
      emailVerified: false,
      providers: IList(<AuthProviderData>[
        AuthProviderData(
            providerId: 'firebase',
            uid: 'uid1234',
            displayName: 'sam',
            photoURL: 'url2',
            email: 'a@a.com',
            phoneNumber: '1234')
      ]));

  // after anonymous sign in
  static AuthUserData get afterAnonymousSignIn => AuthUserData(
      uid: 'Ro8xRcoQWEfRCd3Qqz4dVFu3ois2',
      providers: IList(const []),
      displayName: null,
      photoURL: null,
      email: null,
      phoneNumber: null,
      createdOn: DateTime.parse('2020-07-12T16:22:31.000Z'),
      lastSignedInOn: DateTime.parse('2020-07-12T16:22:31.000Z'),
      isAnonymous: true,
      emailVerified: false);

  // after sign in with github
  static AuthUserData get afterGitHubSignIn => AuthUserData(
      uid: 'EH1CsvnQWEfSGnOPsTbuQsNK22',
      displayName: null,
      photoURL: null,
      email: 'email@gmail.com',
      phoneNumber: null,
      createdOn: DateTime.parse('2020-07-09T18:03:08.000Z'),
      lastSignedInOn: DateTime.parse('2020-07-12T16:23:22.000Z'),
      isAnonymous: false,
      emailVerified: false,
      providers: IList(<AuthProviderData>[
        AuthProviderData(
            providerId: 'github.com',
            uid: 'github.com',
            displayName: 'Tester',
            photoURL:
                'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=wavatar&f=y',
            email: 'email@gmail.com',
            phoneNumber: null)
      ]));
}
