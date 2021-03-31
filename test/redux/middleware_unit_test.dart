import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_process/actions/app_init/plumb_streams_action.dart';
import 'package:the_process/actions/auth/get_authorized_action.dart';
import 'package:the_process/actions/auth/observe_auth_state_action.dart';
import 'package:the_process/actions/auth/sign_in_with_apple_action.dart';
import 'package:the_process/actions/auth/sign_in_with_google_action.dart';
import 'package:the_process/actions/auth/sign_out_action.dart';
import 'package:the_process/actions/platform/detect_platform_action.dart';
import 'package:the_process/actions/platform/launch_url_action.dart';
import 'package:the_process/actions/problems/add_problem_action.dart';
import 'package:the_process/actions/profile/disregard_profile_data_action.dart';
import 'package:the_process/actions/profile/observe_profile_data_action.dart';
import 'package:the_process/actions/sections/create_section_action.dart';
import 'package:the_process/actions/shared/connect_database_action.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/enums/auth/provider_name.dart';
import 'package:the_process/enums/database/database_section.dart';
import 'package:the_process/middleware/app/plumb_streams.dart';
import 'package:the_process/middleware/auth/observe_auth_state.dart';
import 'package:the_process/middleware/auth/sign_in_with_apple.dart';
import 'package:the_process/middleware/auth/sign_in_with_google.dart';
import 'package:the_process/middleware/auth/sign_out.dart';
import 'package:the_process/middleware/platform/detect_platform.dart';
import 'package:the_process/middleware/platform/launch_url.dart';
import 'package:the_process/middleware/profile/disregard_profile_data.dart';
import 'package:the_process/middleware/profile/get_authorized.dart';
import 'package:the_process/middleware/profile/observe_profile_data.dart';
import 'package:the_process/middleware/sections/create_section.dart';
import 'package:the_process/middleware/shared/connect_database.dart';

import '../mocks/redux/fake_store.dart';
import '../mocks/services/auth_service_mock.dart';
import '../mocks/services/database_service_mock.dart';
import '../mocks/services/http_service_mock.dart';
import '../mocks/services/platform_service_mock.dart';

void main() {
  group('Middleware ', () {
    test('PlumStreams catches error', () {
      // Create the middleware and mocks.
      final authServiceMock = AuthServiceMock();
      final databaseServiceMock = DatabaseServiceMock();
      final middleware =
          PlumbStreamsMiddleware(authServiceMock, databaseServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = PlumbStreamsAction();
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(authServiceMock.connectAuthStateToStore()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    });

    test('ObserveAuthState catches error', () {
      // Setup the middleware and mocks.
      final authServiceMock = AuthServiceMock();
      final middleware = ObserveAuthStateMiddleware(authServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = ObserveAuthStateAction();
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(authServiceMock.connectAuthStateToStore()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    });

    test('SignInWithApple catches error', () {
      // Setup the middleware and mocks.
      final authServiceMock = AuthServiceMock();
      final middleware = SignInWithAppleMiddleware(authServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = SignInWithAppleAction();
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(authServiceMock.getAppleCredential()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    });

    test('SignInWithGoogle catches error', () {
      // Setup the middleware and mocks.
      final authServiceMock = AuthServiceMock();
      final databaseServiceMock = DatabaseServiceMock();
      final middleware =
          SignInWithGoogleMiddleware(authServiceMock, databaseServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = SignInWithGoogleAction();
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(authServiceMock.getGoogleCredential()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    });

    test('SignOut catches error', () {
      // Setup the middleware and mocks.
      final authServiceMock = AuthServiceMock();
      final middleware = SignOutMiddleware(authServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = SignOutAction();
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(authServiceMock.signOut()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    });

    test('DetectPlatform catches error', () {
      // Setup the middleware and mocks.
      final platformServiceMock = PlatformServiceMock();
      final middleware = DetectPlatformMiddleware(platformServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = DetectPlatformAction();
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(platformServiceMock.detectPlatform()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    });

    test('LaunchUrl catches error', () {
      // Setup the middleware and mocks.
      final platformServiceMock = PlatformServiceMock();
      final middleware = LaunchUrlMiddleware(platformServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = LaunchUrlAction(url: 'url');
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(platformServiceMock.launchUrl(action.url)).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    });

    test('DisregardProfileData catches error', () {
      // Setup the middleware and mocks.
      final databaseServiceMock = DatabaseServiceMock();
      final middleware = DisregardProfileDataMiddleware(databaseServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = DisregardProfileDataAction();
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(databaseServiceMock.disconnect(DatabaseSection.profileData))
          .thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    });

    test('GetAuthorized catches error', () {
      // Setup the middleware and mocks.
      final databaseServiceMock = DatabaseServiceMock();
      final platformServiceMock = PlatformServiceMock();
      final middleware =
          GetAuthorizedMiddleware(databaseServiceMock, platformServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = GetAuthorizedAction(provider: ProviderName.google);
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(databaseServiceMock.updateAuthorizationStep(
              provider: action.provider,
              uid: '-',
              step: AuthorizationStep.gettingAuthorized))
          .thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    });

    test('ObserveProfileData catches error', () {
      // Setup the middleware and mocks.
      final databaseServiceMock = DatabaseServiceMock();
      final middleware = ObserveProfileDataMiddleware(databaseServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = ObserveProfileDataAction();
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(databaseServiceMock.connectProfileData(uid: '-')).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    });

    test('CreateSection catches error', () {
      // Setup the middleware and mocks.
      final httpServiceMock = HttpServiceMock();
      final middleware = CreateSectionMiddleware(httpServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = CreateSectionAction();
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(httpServiceMock.createSection(name: 'section')).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    }, skip: true);

    test('ConnectDatabase catches error', () {
      // Setup the middleware and mocks.
      final databaseServiceMock = DatabaseServiceMock();
      final middleware = ConnectDatabaseMiddleware(databaseServiceMock);

      // Create the middleware dependencies.
      final fakeStore = FakeStore();
      final action = ConnectDatabaseAction(section: DatabaseSection.sections);
      final nullDispatcher = (dynamic _) => null;

      // Create the error to catch.
      when(databaseServiceMock.connectSections()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, nullDispatcher);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatchedActions.last is AddProblemAction, true);
    });
  });
}
