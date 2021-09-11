import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redfire/src/auth/models/apple_id_credential.dart';
import 'package:redfire/src/auth/models/auth_provider_data.dart';
import 'package:redfire/src/auth/models/auth_user_data.dart';
import 'package:redfire/src/auth/models/google_sign_in_credential.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

extension FirebaseUserExtension on User {
  AuthUserData toModel() => AuthUserData(
      uid: uid,
      displayName: displayName,
      photoURL: photoURL,
      email: email,
      phoneNumber: phoneNumber,
      createdOn: metadata.creationTime?.toUtc(),
      lastSignedInOn: metadata.lastSignInTime?.toUtc(),
      isAnonymous: isAnonymous,
      emailVerified: emailVerified,
      providers: providerData
          .map<AuthProviderData>((userInfo) => userInfo.toModel())
          .toIList());
}

extension UserInfoExtension on UserInfo {
  AuthProviderData toModel() => AuthProviderData(
        providerId: providerId,
        uid: uid,
        displayName: displayName,
        photoURL: photoURL,
        email: email,
        phoneNumber: phoneNumber,
      );
}

extension AuthorizationCredentialAppleIDExt on AuthorizationCredentialAppleID {
  AppleIdCredential toModel() => AppleIdCredential(
      userIdentifier: userIdentifier,
      givenName: givenName,
      familyName: familyName,
      email: email,
      authorizationCode: authorizationCode,
      identityToken: identityToken,
      state: state);
}

extension GoogleSignInAuthenticationExtension on GoogleSignInAuthentication {
  GoogleSignInCredential toModel() => GoogleSignInCredential(
      idToken: idToken,
      accessToken: accessToken,
      serverAuthCode: serverAuthCode);
}
