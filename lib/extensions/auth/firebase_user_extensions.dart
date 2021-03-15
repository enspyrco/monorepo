import 'package:firebase_auth/firebase_auth.dart';
import 'package:flireator/models/auth/auth_data.dart';
import 'package:flireator/models/auth/auth_provider_data.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'user_info_extensions.dart';

extension FirebaseUserExt on User {
  AuthData toData() => AuthData(
        uid: uid,
        displayName: displayName ?? '-',
        photoURL: photoURL ?? '-',
        email: email ?? '-',
        phoneNumber: phoneNumber ?? '-',
        createdOn: metadata.creationTime?.toUtc() ?? DateTime.now().toUtc(),
        lastSignedInOn:
            metadata.lastSignInTime?.toUtc() ?? DateTime.now().toUtc(),
        isAnonymous: isAnonymous,
        emailVerified: emailVerified,
        providers: providerData
            .map<AuthProviderData>((userInfo) => userInfo.toAuthProviderData())
            .toIList(),
      );
}
