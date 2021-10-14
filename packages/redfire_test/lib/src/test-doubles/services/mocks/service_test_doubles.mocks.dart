// Mocks generated by Mockito 5.0.16 from annotations
// in redfire_test/src/test-doubles/services/mocks/service_test_doubles.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:fast_immutable_collections/fast_immutable_collections.dart'
    as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:redfire/src/auth/actions/set_auth_user_data_action.dart' as _i7;
import 'package:redfire/src/auth/services/auth_service.dart' as _i5;
import 'package:redfire/src/database/services/database_service.dart' as _i8;
import 'package:redfire/src/networking/services/http_service.dart' as _i11;
import 'package:redfire/src/platform/services/platform_service.dart' as _i9;
import 'package:redfire/src/settings/enums/platform_enum.dart' as _i10;
import 'package:redfire/types.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeAuthUserData_0 extends _i1.Fake implements _i2.AuthUserData {}

class _FakeISet_1<T> extends _i1.Fake implements _i3.ISet<T> {
  @override
  String toString([bool? prettyPrint]) => super.toString();
}

class _FakeUserCredential_2 extends _i1.Fake implements _i4.UserCredential {}

class _FakeAppleIdCredential_3 extends _i1.Fake
    implements _i2.AppleIdCredential {}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i5.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Stream<_i7.SetAuthUserDataAction> get streamOfSetAuthUserData =>
      (super.noSuchMethod(Invocation.getter(#streamOfSetAuthUserData),
              returnValue: Stream<_i7.SetAuthUserDataAction>.empty())
          as _i6.Stream<_i7.SetAuthUserDataAction>);
  @override
  _i6.Future<String> getCurrentIdToken() =>
      (super.noSuchMethod(Invocation.method(#getCurrentIdToken, []),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  String getCurrentUserId() =>
      (super.noSuchMethod(Invocation.method(#getCurrentUserId, []),
          returnValue: '') as String);
  @override
  _i6.Future<_i2.AuthUserData> signInAnonymously() => (super.noSuchMethod(
          Invocation.method(#signInAnonymously, []),
          returnValue: Future<_i2.AuthUserData>.value(_FakeAuthUserData_0()))
      as _i6.Future<_i2.AuthUserData>);
  @override
  _i6.Future<_i3.ISet<_i2.ProvidersEnum>> retrieveProvidersFor(String? email) =>
      (super.noSuchMethod(Invocation.method(#retrieveProvidersFor, [email]),
              returnValue: Future<_i3.ISet<_i2.ProvidersEnum>>.value(
                  _FakeISet_1<_i2.ProvidersEnum>()))
          as _i6.Future<_i3.ISet<_i2.ProvidersEnum>>);
  @override
  _i6.Future<_i4.UserCredential> signUpWithEmailAndPassword(
          String? email, String? password) =>
      (super.noSuchMethod(
              Invocation.method(#signUpWithEmailAndPassword, [email, password]),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.UserCredential> signInWithEmailAndPassword(
          String? email, String? password) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [email, password]),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i2.GoogleSignInCredential?> getGoogleCredential() =>
      (super.noSuchMethod(Invocation.method(#getGoogleCredential, []),
              returnValue: Future<_i2.GoogleSignInCredential?>.value())
          as _i6.Future<_i2.GoogleSignInCredential?>);
  @override
  _i6.Future<_i2.AuthUserData> signInWithGoogle(
          {_i2.GoogleSignInCredential? credential}) =>
      (super.noSuchMethod(
          Invocation.method(#signInWithGoogle, [], {#credential: credential}),
          returnValue:
              Future<_i2.AuthUserData>.value(_FakeAuthUserData_0())) as _i6
          .Future<_i2.AuthUserData>);
  @override
  _i6.Future<_i2.AuthUserData> linkGoogle(
          {_i2.GoogleSignInCredential? credential}) =>
      (super.noSuchMethod(
              Invocation.method(#linkGoogle, [], {#credential: credential}),
              returnValue:
                  Future<_i2.AuthUserData>.value(_FakeAuthUserData_0()))
          as _i6.Future<_i2.AuthUserData>);
  @override
  _i6.Future<String> getTokenForGoogle(List<String>? scopes) =>
      (super.noSuchMethod(Invocation.method(#getTokenForGoogle, [scopes]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i2.AppleIdCredential> getAppleCredential() => (super.noSuchMethod(
          Invocation.method(#getAppleCredential, []),
          returnValue:
              Future<_i2.AppleIdCredential>.value(_FakeAppleIdCredential_3()))
      as _i6.Future<_i2.AppleIdCredential>);
  @override
  _i6.Future<_i2.AuthUserData> signInWithApple(
          {_i2.AppleIdCredential? credential}) =>
      (super.noSuchMethod(
          Invocation.method(#signInWithApple, [], {#credential: credential}),
          returnValue:
              Future<_i2.AuthUserData>.value(_FakeAuthUserData_0())) as _i6
          .Future<_i2.AuthUserData>);
  @override
  _i6.Future<_i2.AuthUserData> signInWithGithub(String? token) =>
      (super.noSuchMethod(Invocation.method(#signInWithGithub, [token]),
              returnValue:
                  Future<_i2.AuthUserData>.value(_FakeAuthUserData_0()))
          as _i6.Future<_i2.AuthUserData>);
  @override
  _i6.Future<_i2.AuthUserData> linkGithub(String? token) => (super.noSuchMethod(
          Invocation.method(#linkGithub, [token]),
          returnValue: Future<_i2.AuthUserData>.value(_FakeAuthUserData_0()))
      as _i6.Future<_i2.AuthUserData>);
  @override
  _i6.Future<void> signOut(_i2.ProvidersEnum? signInProvider) =>
      (super.noSuchMethod(Invocation.method(#signOut, [signInProvider]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [DatabaseService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseService extends _i1.Mock implements _i8.DatabaseService {
  MockDatabaseService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> createDocument({String? at, Map<String, Object?>? from}) =>
      (super.noSuchMethod(
          Invocation.method(#createDocument, [], {#at: at, #from: from}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<void> setDocument(
          {String? at, Map<String, Object?>? to, bool? merge = false}) =>
      (super.noSuchMethod(
          Invocation.method(
              #setDocument, [], {#at: at, #to: to, #merge: merge}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updateDocument({String? at, Map<String, Object?>? to}) =>
      (super.noSuchMethod(
          Invocation.method(#updateDocument, [], {#at: at, #to: to}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Stream<Map<String, Object?>> tapDocument({String? at}) =>
      (super.noSuchMethod(Invocation.method(#tapDocument, [], {#at: at}),
              returnValue: Stream<Map<String, Object?>>.empty())
          as _i6.Stream<Map<String, Object?>>);
  @override
  _i6.Stream<List<Object?>> tapCollection(
          {String? at,
          Object? where,
          Object? isEqualTo,
          Object? isNotEqualTo,
          Object? isLessThan,
          Object? isLessThanOrEqualTo,
          Object? isGreaterThan,
          Object? isGreaterThanOrEqualTo,
          Object? arrayContains,
          List<Object?>? arrayContainsAny,
          List<Object?>? whereIn,
          List<Object?>? whereNotIn,
          bool? isNull}) =>
      (super.noSuchMethod(
              Invocation.method(#tapCollection, [], {
                #at: at,
                #where: where,
                #isEqualTo: isEqualTo,
                #isNotEqualTo: isNotEqualTo,
                #isLessThan: isLessThan,
                #isLessThanOrEqualTo: isLessThanOrEqualTo,
                #isGreaterThan: isGreaterThan,
                #isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
                #arrayContains: arrayContains,
                #arrayContainsAny: arrayContainsAny,
                #whereIn: whereIn,
                #whereNotIn: whereNotIn,
                #isNull: isNull
              }),
              returnValue: Stream<List<Object?>>.empty())
          as _i6.Stream<List<Object?>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [PlatformService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlatformService extends _i1.Mock implements _i9.PlatformService {
  MockPlatformService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.PlatformsEnum detectPlatform() =>
      (super.noSuchMethod(Invocation.method(#detectPlatform, []),
          returnValue: _i10.PlatformsEnum.web) as _i10.PlatformsEnum);
  @override
  _i6.Future<void> getAuthorized(
          {_i2.ProvidersEnum? provider, String? state}) =>
      (super.noSuchMethod(
          Invocation.method(
              #getAuthorized, [], {#provider: provider, #state: state}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> launchUrl(String? url) =>
      (super.noSuchMethod(Invocation.method(#launchUrl, [url]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [HttpService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpService extends _i1.Mock implements _i11.HttpService {
  MockHttpService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<void> createSection({String? name}) =>
      (super.noSuchMethod(Invocation.method(#createSection, [], {#name: name}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  String toString() => super.toString();
}
