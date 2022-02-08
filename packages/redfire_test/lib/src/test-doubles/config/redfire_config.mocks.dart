// Mocks generated by Mockito 5.0.16 from annotations
// in redfire_test/src/test-doubles/config/redfire_config.dart.
// Do not manually edit this file.

import 'package:firebase_core/firebase_core.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:redfire/src/utils/auth_options.dart' as _i3;
import 'package:redfire/src/utils/red_fire_config.dart' as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeFirebaseOptions_0 extends _i1.Fake implements _i2.FirebaseOptions {}

class _FakeAuthOptions_1 extends _i1.Fake implements _i3.AuthOptions {}

/// A class which mocks [RedFireConfig].
///
/// See the documentation for Mockito's code generation for more information.
class MockRedFireConfig extends _i1.Mock implements _i4.RedFireConfig {
  MockRedFireConfig() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseOptions get firebase =>
      (super.noSuchMethod(Invocation.getter(#firebase),
          returnValue: _FakeFirebaseOptions_0()) as _i2.FirebaseOptions);
  @override
  _i3.AuthOptions get auth => (super.noSuchMethod(Invocation.getter(#auth),
      returnValue: _FakeAuthOptions_1()) as _i3.AuthOptions);
  @override
  String toString() => super.toString();
}

/// A class which mocks [FirebaseOptions].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockFirebaseOptions extends _i1.Mock implements _i2.FirebaseOptions {
  MockFirebaseOptions() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get apiKey =>
      (super.noSuchMethod(Invocation.getter(#apiKey), returnValue: '')
          as String);
  @override
  String get appId =>
      (super.noSuchMethod(Invocation.getter(#appId), returnValue: '')
          as String);
  @override
  String get messagingSenderId => (super
          .noSuchMethod(Invocation.getter(#messagingSenderId), returnValue: '')
      as String);
  @override
  String get projectId =>
      (super.noSuchMethod(Invocation.getter(#projectId), returnValue: '')
          as String);
  @override
  Map<String, String?> get asMap =>
      (super.noSuchMethod(Invocation.getter(#asMap),
          returnValue: <String, String?>{}) as Map<String, String?>);
  @override
  String toString() => super.toString();
}
