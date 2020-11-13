import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:the_process/actions/auth/store_auth_user_data.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/extensions/stream_extensions.dart';
import 'package:the_process/models/auth/apple_id_credential.dart';
import 'package:the_process/models/auth/auth_provider_data.dart';
import 'package:the_process/models/auth/auth_user_data.dart';
import 'package:the_process/models/auth/google_sign_in_credential.dart';

extension GoogleSignInAuthenticationExt on GoogleSignInAuthentication {
  GoogleSignInCredential toModel() => GoogleSignInCredential(
      idToken: idToken,
      accessToken: accessToken,
      serverAuthCode: serverAuthCode);
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

extension ConnectAndConvert on FirebaseAuth {
  /// Observe the auth state and convert each [auth.User]
  /// into a [ReduxAction] and send to the store using the passed in [StreamController]
  StreamSubscription<User> connectAuthState(
      StreamController<ReduxAction> controller) {
    // listen to the onAuthStateChanged stream, convert events to actions and
    // dispatch to the store with the controller
    return authStateChanges().listen((firebaseUser) {
      try {
        controller
            .add(StoreAuthUserData(authUserData: firebaseUser?.toModel()));
      } catch (error, trace) {
        controller.addProblem(error, trace);
      }
    }, onError: controller.addProblem);
  }
}

extension FirebaseUserExt on User {
  AuthUserData toModel() => (this != null)
      ? AuthUserData(
          uid: uid,
          displayName: displayName,
          photoURL: photoURL,
          email: email,
          phoneNumber: phoneNumber,
          createdOn: metadata.creationTime.toUtc(),
          lastSignedInOn: metadata.lastSignInTime.toUtc(),
          isAnonymous: isAnonymous,
          emailVerified: emailVerified,
          providers: BuiltList(providerData
              .map<AuthProviderData>((userInfo) => userInfo.toModel())),
        )
      : null;
}

extension UserInfoExt on UserInfo {
  AuthProviderData toModel() => AuthProviderData(
        providerId: providerId,
        uid: uid,
        displayName: displayName,
        photoURL: photoURL,
        email: email,
        phoneNumber: phoneNumber,
      );
}
