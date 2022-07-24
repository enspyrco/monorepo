import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';

import '../../auth/data/user_example.dart';
import '../../auth/mocks/auth_test_doubles.mocks.dart';
import '../../firebase/mocks/firebase_test_doubles.mocks.dart';
import '../../platform/mocks/platform_test_doubles.mocks.dart';

class ServicesHarness {
  // auth
  late final AuthService _authService;
  late final MockFirebaseAuth _mockFirebaseAuth;
  late final MockGoogleSignIn _mockGoogleSignIn;
  late final MockSignInWithAppleWrapper _mockSignInWithAppleWrapper;
  // database
  late final FirestoreServiceFlutterfire _firestoreService;
  late final MockFirebaseFirestore _mockFirebaseFirestore;
  // platform
  late final PlatformService _platformService;
  late final MockPlatformWrapper _mockPlatformWrapper;
  late final UrlLauncherWrapper _mockUrlLauncherWrapper;

  ServicesHarness() {
    // Create a real AuthService with mock plugins.
    _mockFirebaseAuth = MockFirebaseAuth();
    _mockGoogleSignIn = MockGoogleSignIn();
    _mockSignInWithAppleWrapper = MockSignInWithAppleWrapper();
    _authService = AuthService(
        firebase: _mockFirebaseAuth,
        google: _mockGoogleSignIn,
        apple: _mockSignInWithAppleWrapper);

    // Create a real DatabaseService with mock plugin.
    _mockFirebaseFirestore = MockFirebaseFirestore();
    _firestoreService =
        FirestoreServiceFlutterfire(firestore: _mockFirebaseFirestore);

    // Create a real PlatformService with mock plugins.
    _mockPlatformWrapper = MockPlatformWrapper();
    _mockUrlLauncherWrapper = UrlLauncherWrapper();
    _platformService = PlatformService(
        platformWrapper: _mockPlatformWrapper,
        urlLauncherWrapper: _mockUrlLauncherWrapper);
  }

  // auth
  AuthService get auth => _authService;
  MockFirebaseAuth get mockFirebaseAuth => _mockFirebaseAuth;
  MockGoogleSignIn get mockGoogleSignIn => _mockGoogleSignIn;
  MockSignInWithAppleWrapper get mockSignInWithAppleWrapper =>
      _mockSignInWithAppleWrapper;
  // database
  FirestoreServiceFlutterfire get database => _firestoreService;
  MockFirebaseFirestore get mockFirebaseFirestore => _mockFirebaseFirestore;
  // platform
  PlatformService get platform => _platformService;
  MockPlatformWrapper get mockPlatformWrapper => _mockPlatformWrapper;
  UrlLauncherWrapper get mockUrlLauncherWrapper => _mockUrlLauncherWrapper;
}

class ServicesHarnessForAuth extends ServicesHarness {
  final _userStreamController = StreamController<User>();

  ServicesHarnessForAuth() {
    // Setup the firebase auth mock to allow emitting a user later in the test
    when(mockFirebaseAuth.authStateChanges())
        .thenAnswer((_) => _userStreamController.stream);

    when(mockPlatformWrapper.isMacOS).thenReturn(true);
  }

  void emitStubbedUser() {
    _userStreamController.add(UserExample.stubBasicMock());
  }
}
