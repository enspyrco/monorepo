// Mocks generated by Mockito 5.0.16 from annotations
// in redfire_test/src/test-doubles/firebase/mocks/firebase_test_doubles.dart.
// Do not manually edit this file.

import 'dart:async' as _i8;
import 'dart:typed_data' as _i9;

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart'
    as _i4;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart'
    as _i6;
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart'
    as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeFirebaseOptions_0 extends _i1.Fake implements _i2.FirebaseOptions {}

class _FakeFirebaseApp_1 extends _i1.Fake implements _i3.FirebaseApp {}

class _FakeSettings_2 extends _i1.Fake implements _i4.Settings {}

class _FakeCollectionReference_3<T extends Object?> extends _i1.Fake
    implements _i5.CollectionReference<T> {}

class _FakeWriteBatch_4 extends _i1.Fake implements _i5.WriteBatch {}

class _FakeLoadBundleTask_5 extends _i1.Fake implements _i5.LoadBundleTask {}

class _FakeQuerySnapshot_6<T extends Object?> extends _i1.Fake
    implements _i5.QuerySnapshot<T> {}

class _FakeQuery_7<T extends Object?> extends _i1.Fake implements _i5.Query<T> {
}

class _FakeDocumentReference_8<T extends Object?> extends _i1.Fake
    implements _i5.DocumentReference<T> {}

class _FakeFirebaseFirestore_9 extends _i1.Fake
    implements _i5.FirebaseFirestore {}

class _FakeDocumentSnapshot_10<T extends Object?> extends _i1.Fake
    implements _i5.DocumentSnapshot<T> {}

class _FakeActionCodeInfo_11 extends _i1.Fake implements _i6.ActionCodeInfo {}

class _FakeUserCredential_12 extends _i1.Fake implements _i7.UserCredential {}

class _FakeConfirmationResult_13 extends _i1.Fake
    implements _i7.ConfirmationResult {}

class _FakeUserMetadata_14 extends _i1.Fake implements _i6.UserMetadata {}

class _FakeIdTokenResult_15 extends _i1.Fake implements _i6.IdTokenResult {}

class _FakeUser_16 extends _i1.Fake implements _i7.User {}

/// A class which mocks [FirebaseApp].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseApp extends _i1.Mock implements _i3.FirebaseApp {
  MockFirebaseApp() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get name =>
      (super.noSuchMethod(Invocation.getter(#name), returnValue: '') as String);
  @override
  _i2.FirebaseOptions get options =>
      (super.noSuchMethod(Invocation.getter(#options),
          returnValue: _FakeFirebaseOptions_0()) as _i2.FirebaseOptions);
  @override
  bool get isAutomaticDataCollectionEnabled =>
      (super.noSuchMethod(Invocation.getter(#isAutomaticDataCollectionEnabled),
          returnValue: false) as bool);
  @override
  _i8.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> setAutomaticDataCollectionEnabled(bool? enabled) =>
      (super.noSuchMethod(
          Invocation.method(#setAutomaticDataCollectionEnabled, [enabled]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> setAutomaticResourceManagementEnabled(bool? enabled) =>
      (super.noSuchMethod(
          Invocation.method(#setAutomaticResourceManagementEnabled, [enabled]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [FirebaseFirestore].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseFirestore extends _i1.Mock implements _i5.FirebaseFirestore {
  MockFirebaseFirestore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.FirebaseApp get app => (super.noSuchMethod(Invocation.getter(#app),
      returnValue: _FakeFirebaseApp_1()) as _i3.FirebaseApp);
  @override
  set app(_i3.FirebaseApp? _app) =>
      super.noSuchMethod(Invocation.setter(#app, _app),
          returnValueForMissingStub: null);
  @override
  set settings(_i4.Settings? settings) =>
      super.noSuchMethod(Invocation.setter(#settings, settings),
          returnValueForMissingStub: null);
  @override
  _i4.Settings get settings => (super.noSuchMethod(Invocation.getter(#settings),
      returnValue: _FakeSettings_2()) as _i4.Settings);
  @override
  Map<dynamic, dynamic> get pluginConstants =>
      (super.noSuchMethod(Invocation.getter(#pluginConstants),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  _i5.CollectionReference<Map<String, dynamic>> collection(
          String? collectionPath) =>
      (super.noSuchMethod(Invocation.method(#collection, [collectionPath]),
              returnValue: _FakeCollectionReference_3<Map<String, dynamic>>())
          as _i5.CollectionReference<Map<String, dynamic>>);
  @override
  _i5.WriteBatch batch() => (super.noSuchMethod(Invocation.method(#batch, []),
      returnValue: _FakeWriteBatch_4()) as _i5.WriteBatch);
  @override
  _i8.Future<void> clearPersistence() =>
      (super.noSuchMethod(Invocation.method(#clearPersistence, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> enablePersistence(
          [_i4.PersistenceSettings? persistenceSettings]) =>
      (super.noSuchMethod(
          Invocation.method(#enablePersistence, [persistenceSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i5.LoadBundleTask loadBundle(_i9.Uint8List? bundle) =>
      (super.noSuchMethod(Invocation.method(#loadBundle, [bundle]),
          returnValue: _FakeLoadBundleTask_5()) as _i5.LoadBundleTask);
  @override
  void useFirestoreEmulator(String? host, int? port,
          {bool? sslEnabled = false}) =>
      super.noSuchMethod(
          Invocation.method(
              #useFirestoreEmulator, [host, port], {#sslEnabled: sslEnabled}),
          returnValueForMissingStub: null);
  @override
  _i8.Future<_i5.QuerySnapshot<Map<String, dynamic>>> namedQueryGet(
          String? name,
          {_i4.GetOptions? options = const _i4.GetOptions()}) =>
      (super.noSuchMethod(
          Invocation.method(#namedQueryGet, [name], {#options: options}),
          returnValue: Future<_i5.QuerySnapshot<Map<String, dynamic>>>.value(
              _FakeQuerySnapshot_6<Map<String, dynamic>>())) as _i8
          .Future<_i5.QuerySnapshot<Map<String, dynamic>>>);
  @override
  _i5.Query<Map<String, dynamic>> collectionGroup(String? collectionPath) =>
      (super.noSuchMethod(Invocation.method(#collectionGroup, [collectionPath]),
              returnValue: _FakeQuery_7<Map<String, dynamic>>())
          as _i5.Query<Map<String, dynamic>>);
  @override
  _i8.Future<void> disableNetwork() =>
      (super.noSuchMethod(Invocation.method(#disableNetwork, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i5.DocumentReference<Map<String, dynamic>> doc(String? documentPath) =>
      (super.noSuchMethod(Invocation.method(#doc, [documentPath]),
              returnValue: _FakeDocumentReference_8<Map<String, dynamic>>())
          as _i5.DocumentReference<Map<String, dynamic>>);
  @override
  _i8.Future<void> enableNetwork() =>
      (super.noSuchMethod(Invocation.method(#enableNetwork, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Stream<void> snapshotsInSync() =>
      (super.noSuchMethod(Invocation.method(#snapshotsInSync, []),
          returnValue: Stream<void>.empty()) as _i8.Stream<void>);
  @override
  _i8.Future<T> runTransaction<T>(_i5.TransactionHandler<T>? transactionHandler,
          {Duration? timeout = const Duration(seconds: 30)}) =>
      (super.noSuchMethod(
          Invocation.method(
              #runTransaction, [transactionHandler], {#timeout: timeout}),
          returnValue: Future<T>.value(null)) as _i8.Future<T>);
  @override
  _i8.Future<void> terminate() =>
      (super.noSuchMethod(Invocation.method(#terminate, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> waitForPendingWrites() =>
      (super.noSuchMethod(Invocation.method(#waitForPendingWrites, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [DocumentReference].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockDocumentReference<T extends Object?> extends _i1.Mock
    implements _i5.DocumentReference<T> {
  MockDocumentReference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.FirebaseFirestore get firestore =>
      (super.noSuchMethod(Invocation.getter(#firestore),
          returnValue: _FakeFirebaseFirestore_9()) as _i5.FirebaseFirestore);
  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  _i5.CollectionReference<T> get parent =>
      (super.noSuchMethod(Invocation.getter(#parent),
              returnValue: _FakeCollectionReference_3<T>())
          as _i5.CollectionReference<T>);
  @override
  String get path =>
      (super.noSuchMethod(Invocation.getter(#path), returnValue: '') as String);
  @override
  _i5.CollectionReference<Map<String, dynamic>> collection(
          String? collectionPath) =>
      (super.noSuchMethod(Invocation.method(#collection, [collectionPath]),
              returnValue: _FakeCollectionReference_3<Map<String, dynamic>>())
          as _i5.CollectionReference<Map<String, dynamic>>);
  @override
  _i8.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> update(Map<String, Object?>? data) =>
      (super.noSuchMethod(Invocation.method(#update, [data]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<_i5.DocumentSnapshot<T>> get([_i4.GetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#get, [options]),
              returnValue: Future<_i5.DocumentSnapshot<T>>.value(
                  _FakeDocumentSnapshot_10<T>()))
          as _i8.Future<_i5.DocumentSnapshot<T>>);
  @override
  _i8.Stream<_i5.DocumentSnapshot<T>> snapshots(
          {bool? includeMetadataChanges = false}) =>
      (super.noSuchMethod(
              Invocation.method(#snapshots, [],
                  {#includeMetadataChanges: includeMetadataChanges}),
              returnValue: Stream<_i5.DocumentSnapshot<T>>.empty())
          as _i8.Stream<_i5.DocumentSnapshot<T>>);
  @override
  _i8.Future<void> set(T? data, [_i4.SetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#set, [data, options]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i5.DocumentReference<R> withConverter<R>(
          {_i5.FromFirestore<R>? fromFirestore,
          _i5.ToFirestore<R>? toFirestore}) =>
      (super.noSuchMethod(
              Invocation.method(#withConverter, [],
                  {#fromFirestore: fromFirestore, #toFirestore: toFirestore}),
              returnValue: _FakeDocumentReference_8<R>())
          as _i5.DocumentReference<R>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [CollectionReference].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockCollectionReference<T extends Object?> extends _i1.Mock
    implements _i5.CollectionReference<T> {
  MockCollectionReference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  String get path =>
      (super.noSuchMethod(Invocation.getter(#path), returnValue: '') as String);
  @override
  _i5.FirebaseFirestore get firestore =>
      (super.noSuchMethod(Invocation.getter(#firestore),
          returnValue: _FakeFirebaseFirestore_9()) as _i5.FirebaseFirestore);
  @override
  Map<String, dynamic> get parameters =>
      (super.noSuchMethod(Invocation.getter(#parameters),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  _i8.Future<_i5.DocumentReference<T>> add(T? data) =>
      (super.noSuchMethod(Invocation.method(#add, [data]),
              returnValue: Future<_i5.DocumentReference<T>>.value(
                  _FakeDocumentReference_8<T>()))
          as _i8.Future<_i5.DocumentReference<T>>);
  @override
  _i5.DocumentReference<T> doc([String? path]) => (super.noSuchMethod(
      Invocation.method(#doc, [path]),
      returnValue: _FakeDocumentReference_8<T>()) as _i5.DocumentReference<T>);
  @override
  _i5.CollectionReference<R> withConverter<R extends Object?>(
          {_i5.FromFirestore<R>? fromFirestore,
          _i5.ToFirestore<R>? toFirestore}) =>
      (super.noSuchMethod(
              Invocation.method(#withConverter, [],
                  {#fromFirestore: fromFirestore, #toFirestore: toFirestore}),
              returnValue: _FakeCollectionReference_3<R>())
          as _i5.CollectionReference<R>);
  @override
  String toString() => super.toString();
  @override
  _i5.Query<T> endAtDocument(_i5.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(Invocation.method(#endAtDocument, [documentSnapshot]),
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
  @override
  _i5.Query<T> endAt(List<Object?>? values) =>
      (super.noSuchMethod(Invocation.method(#endAt, [values]),
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
  @override
  _i5.Query<T> endBeforeDocument(
          _i5.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(
          Invocation.method(#endBeforeDocument, [documentSnapshot]),
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
  @override
  _i5.Query<T> endBefore(List<Object?>? values) =>
      (super.noSuchMethod(Invocation.method(#endBefore, [values]),
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
  @override
  _i8.Future<_i5.QuerySnapshot<T>> get([_i4.GetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#get, [options]),
              returnValue:
                  Future<_i5.QuerySnapshot<T>>.value(_FakeQuerySnapshot_6<T>()))
          as _i8.Future<_i5.QuerySnapshot<T>>);
  @override
  _i5.Query<T> limit(int? limit) =>
      (super.noSuchMethod(Invocation.method(#limit, [limit]),
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
  @override
  _i5.Query<T> limitToLast(int? limit) =>
      (super.noSuchMethod(Invocation.method(#limitToLast, [limit]),
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
  @override
  _i8.Stream<_i5.QuerySnapshot<T>> snapshots(
          {bool? includeMetadataChanges = false}) =>
      (super.noSuchMethod(
              Invocation.method(#snapshots, [],
                  {#includeMetadataChanges: includeMetadataChanges}),
              returnValue: Stream<_i5.QuerySnapshot<T>>.empty())
          as _i8.Stream<_i5.QuerySnapshot<T>>);
  @override
  _i5.Query<T> orderBy(Object? field, {bool? descending = false}) =>
      (super.noSuchMethod(
          Invocation.method(#orderBy, [field], {#descending: descending}),
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
  @override
  _i5.Query<T> startAfterDocument(
          _i5.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(
          Invocation.method(#startAfterDocument, [documentSnapshot]),
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
  @override
  _i5.Query<T> startAfter(List<Object?>? values) =>
      (super.noSuchMethod(Invocation.method(#startAfter, [values]),
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
  @override
  _i5.Query<T> startAtDocument(
          _i5.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(
          Invocation.method(#startAtDocument, [documentSnapshot]),
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
  @override
  _i5.Query<T> startAt(List<Object?>? values) =>
      (super.noSuchMethod(Invocation.method(#startAt, [values]),
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
  @override
  _i5.Query<T> where(Object? field,
          {Object? isEqualTo,
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
          Invocation.method(#where, [
            field
          ], {
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
          returnValue: _FakeQuery_7<T>()) as _i5.Query<T>);
}

/// A class which mocks [FirebaseAuth].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAuth extends _i1.Mock implements _i7.FirebaseAuth {
  MockFirebaseAuth() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.FirebaseApp get app => (super.noSuchMethod(Invocation.getter(#app),
      returnValue: _FakeFirebaseApp_1()) as _i3.FirebaseApp);
  @override
  set app(_i3.FirebaseApp? _app) =>
      super.noSuchMethod(Invocation.setter(#app, _app),
          returnValueForMissingStub: null);
  @override
  set tenantId(String? tenantId) =>
      super.noSuchMethod(Invocation.setter(#tenantId, tenantId),
          returnValueForMissingStub: null);
  @override
  Map<dynamic, dynamic> get pluginConstants =>
      (super.noSuchMethod(Invocation.getter(#pluginConstants),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  _i8.Future<void> useEmulator(String? origin) =>
      (super.noSuchMethod(Invocation.method(#useEmulator, [origin]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> useAuthEmulator(String? host, int? port) =>
      (super.noSuchMethod(Invocation.method(#useAuthEmulator, [host, port]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> applyActionCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#applyActionCode, [code]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<_i6.ActionCodeInfo> checkActionCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#checkActionCode, [code]),
              returnValue:
                  Future<_i6.ActionCodeInfo>.value(_FakeActionCodeInfo_11()))
          as _i8.Future<_i6.ActionCodeInfo>);
  @override
  _i8.Future<void> confirmPasswordReset({String? code, String? newPassword}) =>
      (super.noSuchMethod(
          Invocation.method(#confirmPasswordReset, [],
              {#code: code, #newPassword: newPassword}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<_i7.UserCredential> createUserWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#createUserWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue:
                  Future<_i7.UserCredential>.value(_FakeUserCredential_12()))
          as _i8.Future<_i7.UserCredential>);
  @override
  _i8.Future<List<String>> fetchSignInMethodsForEmail(String? email) => (super
          .noSuchMethod(Invocation.method(#fetchSignInMethodsForEmail, [email]),
              returnValue: Future<List<String>>.value(<String>[]))
      as _i8.Future<List<String>>);
  @override
  _i8.Future<_i7.UserCredential> getRedirectResult() =>
      (super.noSuchMethod(Invocation.method(#getRedirectResult, []),
              returnValue:
                  Future<_i7.UserCredential>.value(_FakeUserCredential_12()))
          as _i8.Future<_i7.UserCredential>);
  @override
  bool isSignInWithEmailLink(String? emailLink) => (super.noSuchMethod(
      Invocation.method(#isSignInWithEmailLink, [emailLink]),
      returnValue: false) as bool);
  @override
  _i8.Stream<_i7.User?> authStateChanges() =>
      (super.noSuchMethod(Invocation.method(#authStateChanges, []),
          returnValue: Stream<_i7.User?>.empty()) as _i8.Stream<_i7.User?>);
  @override
  _i8.Stream<_i7.User?> idTokenChanges() =>
      (super.noSuchMethod(Invocation.method(#idTokenChanges, []),
          returnValue: Stream<_i7.User?>.empty()) as _i8.Stream<_i7.User?>);
  @override
  _i8.Stream<_i7.User?> userChanges() =>
      (super.noSuchMethod(Invocation.method(#userChanges, []),
          returnValue: Stream<_i7.User?>.empty()) as _i8.Stream<_i7.User?>);
  @override
  _i8.Future<void> sendPasswordResetEmail(
          {String? email, _i6.ActionCodeSettings? actionCodeSettings}) =>
      (super.noSuchMethod(
          Invocation.method(#sendPasswordResetEmail, [],
              {#email: email, #actionCodeSettings: actionCodeSettings}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> sendSignInLinkToEmail(
          {String? email, _i6.ActionCodeSettings? actionCodeSettings}) =>
      (super.noSuchMethod(
          Invocation.method(#sendSignInLinkToEmail, [],
              {#email: email, #actionCodeSettings: actionCodeSettings}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> setLanguageCode(String? languageCode) =>
      (super.noSuchMethod(Invocation.method(#setLanguageCode, [languageCode]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> setSettings(
          {bool? appVerificationDisabledForTesting,
          String? userAccessGroup,
          String? phoneNumber,
          String? smsCode,
          bool? forceRecaptchaFlow}) =>
      (super.noSuchMethod(
          Invocation.method(#setSettings, [], {
            #appVerificationDisabledForTesting:
                appVerificationDisabledForTesting,
            #userAccessGroup: userAccessGroup,
            #phoneNumber: phoneNumber,
            #smsCode: smsCode,
            #forceRecaptchaFlow: forceRecaptchaFlow
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> setPersistence(_i6.Persistence? persistence) =>
      (super.noSuchMethod(Invocation.method(#setPersistence, [persistence]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<_i7.UserCredential> signInAnonymously() =>
      (super.noSuchMethod(Invocation.method(#signInAnonymously, []),
              returnValue:
                  Future<_i7.UserCredential>.value(_FakeUserCredential_12()))
          as _i8.Future<_i7.UserCredential>);
  @override
  _i8.Future<_i7.UserCredential> signInWithCredential(
          _i6.AuthCredential? credential) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithCredential, [credential]),
              returnValue:
                  Future<_i7.UserCredential>.value(_FakeUserCredential_12()))
          as _i8.Future<_i7.UserCredential>);
  @override
  _i8.Future<_i7.UserCredential> signInWithCustomToken(String? token) =>
      (super.noSuchMethod(Invocation.method(#signInWithCustomToken, [token]),
              returnValue:
                  Future<_i7.UserCredential>.value(_FakeUserCredential_12()))
          as _i8.Future<_i7.UserCredential>);
  @override
  _i8.Future<_i7.UserCredential> signInWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue:
                  Future<_i7.UserCredential>.value(_FakeUserCredential_12()))
          as _i8.Future<_i7.UserCredential>);
  @override
  _i8.Future<_i7.UserCredential> signInWithEmailLink(
          {String? email, String? emailLink}) =>
      (super.noSuchMethod(
          Invocation.method(
              #signInWithEmailLink, [], {#email: email, #emailLink: emailLink}),
          returnValue:
              Future<_i7.UserCredential>.value(_FakeUserCredential_12())) as _i8
          .Future<_i7.UserCredential>);
  @override
  _i8.Future<_i7.ConfirmationResult> signInWithPhoneNumber(String? phoneNumber,
          [_i7.RecaptchaVerifier? verifier]) =>
      (super.noSuchMethod(
          Invocation.method(#signInWithPhoneNumber, [phoneNumber, verifier]),
          returnValue: Future<_i7.ConfirmationResult>.value(
              _FakeConfirmationResult_13())) as _i8
          .Future<_i7.ConfirmationResult>);
  @override
  _i8.Future<_i7.UserCredential> signInWithPopup(_i6.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#signInWithPopup, [provider]),
              returnValue:
                  Future<_i7.UserCredential>.value(_FakeUserCredential_12()))
          as _i8.Future<_i7.UserCredential>);
  @override
  _i8.Future<void> signInWithRedirect(_i6.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#signInWithRedirect, [provider]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<String> verifyPasswordResetCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#verifyPasswordResetCode, [code]),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<void> verifyPhoneNumber(
          {String? phoneNumber,
          _i6.PhoneVerificationCompleted? verificationCompleted,
          _i6.PhoneVerificationFailed? verificationFailed,
          _i6.PhoneCodeSent? codeSent,
          _i6.PhoneCodeAutoRetrievalTimeout? codeAutoRetrievalTimeout,
          String? autoRetrievedSmsCodeForTesting,
          Duration? timeout = const Duration(seconds: 30),
          int? forceResendingToken}) =>
      (super.noSuchMethod(
          Invocation.method(#verifyPhoneNumber, [], {
            #phoneNumber: phoneNumber,
            #verificationCompleted: verificationCompleted,
            #verificationFailed: verificationFailed,
            #codeSent: codeSent,
            #codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
            #autoRetrievedSmsCodeForTesting: autoRetrievedSmsCodeForTesting,
            #timeout: timeout,
            #forceResendingToken: forceResendingToken
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [User].
///
/// See the documentation for Mockito's code generation for more information.
class MockUser extends _i1.Mock implements _i7.User {
  MockUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get emailVerified =>
      (super.noSuchMethod(Invocation.getter(#emailVerified), returnValue: false)
          as bool);
  @override
  bool get isAnonymous =>
      (super.noSuchMethod(Invocation.getter(#isAnonymous), returnValue: false)
          as bool);
  @override
  _i6.UserMetadata get metadata =>
      (super.noSuchMethod(Invocation.getter(#metadata),
          returnValue: _FakeUserMetadata_14()) as _i6.UserMetadata);
  @override
  List<_i6.UserInfo> get providerData =>
      (super.noSuchMethod(Invocation.getter(#providerData),
          returnValue: <_i6.UserInfo>[]) as List<_i6.UserInfo>);
  @override
  String get uid =>
      (super.noSuchMethod(Invocation.getter(#uid), returnValue: '') as String);
  @override
  _i8.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<String> getIdToken([bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdToken, [forceRefresh]),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<_i6.IdTokenResult> getIdTokenResult(
          [bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdTokenResult, [forceRefresh]),
              returnValue:
                  Future<_i6.IdTokenResult>.value(_FakeIdTokenResult_15()))
          as _i8.Future<_i6.IdTokenResult>);
  @override
  _i8.Future<_i7.UserCredential> linkWithCredential(
          _i6.AuthCredential? credential) =>
      (super.noSuchMethod(Invocation.method(#linkWithCredential, [credential]),
              returnValue:
                  Future<_i7.UserCredential>.value(_FakeUserCredential_12()))
          as _i8.Future<_i7.UserCredential>);
  @override
  _i8.Future<_i7.UserCredential> linkWithPopup(_i6.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#linkWithPopup, [provider]),
              returnValue:
                  Future<_i7.UserCredential>.value(_FakeUserCredential_12()))
          as _i8.Future<_i7.UserCredential>);
  @override
  _i8.Future<_i7.ConfirmationResult> linkWithPhoneNumber(String? phoneNumber,
          [_i7.RecaptchaVerifier? verifier]) =>
      (super.noSuchMethod(
              Invocation.method(#linkWithPhoneNumber, [phoneNumber, verifier]),
              returnValue: Future<_i7.ConfirmationResult>.value(
                  _FakeConfirmationResult_13()))
          as _i8.Future<_i7.ConfirmationResult>);
  @override
  _i8.Future<_i7.UserCredential> reauthenticateWithCredential(
          _i6.AuthCredential? credential) =>
      (super.noSuchMethod(
              Invocation.method(#reauthenticateWithCredential, [credential]),
              returnValue:
                  Future<_i7.UserCredential>.value(_FakeUserCredential_12()))
          as _i8.Future<_i7.UserCredential>);
  @override
  _i8.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> sendEmailVerification(
          [_i6.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(#sendEmailVerification, [actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<_i7.User> unlink(String? providerId) =>
      (super.noSuchMethod(Invocation.method(#unlink, [providerId]),
              returnValue: Future<_i7.User>.value(_FakeUser_16()))
          as _i8.Future<_i7.User>);
  @override
  _i8.Future<void> updateEmail(String? newEmail) =>
      (super.noSuchMethod(Invocation.method(#updateEmail, [newEmail]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> updatePassword(String? newPassword) =>
      (super.noSuchMethod(Invocation.method(#updatePassword, [newPassword]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> updatePhoneNumber(
          _i6.PhoneAuthCredential? phoneCredential) =>
      (super.noSuchMethod(
          Invocation.method(#updatePhoneNumber, [phoneCredential]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> updateDisplayName(String? displayName) =>
      (super.noSuchMethod(Invocation.method(#updateDisplayName, [displayName]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> updatePhotoURL(String? photoURL) =>
      (super.noSuchMethod(Invocation.method(#updatePhotoURL, [photoURL]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> updateProfile({String? displayName, String? photoURL}) =>
      (super.noSuchMethod(
          Invocation.method(#updateProfile, [],
              {#displayName: displayName, #photoURL: photoURL}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<void> verifyBeforeUpdateEmail(String? newEmail,
          [_i6.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(
              #verifyBeforeUpdateEmail, [newEmail, actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [UserCredential].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserCredential extends _i1.Mock implements _i7.UserCredential {
  MockUserCredential() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
}
