import 'package:test/test.dart';

void main() {
  // test(
  //     '_signInWithGoogle starts signin sequence and dispatches emitted actions',
  //     () async {
  //   // setup a mock auth service to give a test response
  //   final mockAuthService = MockAuthService();
  //   when(mockAuthService.googleSignInStream).thenAnswer(
  //     (_) => Stream.fromIterable([
  //       SetAuthStepAction.contactingGoogle(),
  //       AddProblemAction(ProblemInfo('m'))
  //     ]),
  //   );

  //   final store = FakedOutStore(authService: mockAuthService);

  //   // dispatch action to initiate signin
  //   store.dispatch(SignInWithGoogleAction());

  //   // verify the middleware used the service to get a stream of actions
  //   verify(mockAuthService.googleSignInStream);

  //   // wait for the stream to complete so we can test that the middleware did it's thing
  //   await for (ReduxAction _ in mockAuthService.googleSignInStream) {}

  //   // all the middleware does is dispatch a StoreAuthState action so check the state
  //   expect(store.state.authStep, 1);
  //   expect(store.state.problems.length, 1);
  // });

  test('googleSignInStream resets auth steps on cancel', () {
    // final service = AuthService(
    //     FakeFirebaseAuth1(), FakeGoogleSignInCancels(), FakeAppleSignIn());

    // // the service should set auth step to 1 (signing in with google)
    // // then due to user cancel (which means google sign in returns null)
    // // the service should reset the auth step to 0
    // final expectedAuthSteps = [1, 0];

    // service.googleSignInStream.listen(expectAsync1((action) {
    //   expect((action as SetAuthStepAction).step,
    //       expectedAuthSteps.removeAt(0));
    // }, count: 2));
  });

  test('googleSignInStream emits StoreAuthStep actions at each stage', () {
    // final service = AuthService(
    //     FakeFirebaseAuth1(), FakeGoogleSignIn(), FakeAppleSignIn());

    // // the service should set auth step to 1 (signing in with google)
    // // then 2 (signing in with Firebase) then reset to 0
    // final expectedAuthSteps = [1, 2, 0];

    // service.googleSignInStream.listen(expectAsync1((action) {
    //   expect((action as SetAuthStepAction).step,
    //       expectedAuthSteps.removeAt(0));
    // }, count: 3));
  });

  // test that errors are handled by being passed to the store
  test('googleSignInStream catches errors and emits StoreProblem actions',
      () async {
    // final service = AuthService(
    //     FakeFirebaseAuth1(), FakeGoogleSignInThrows(), FakeAppleSignIn());

    // // the service will emit step 1 indicating google signin is occuring
    // // the google signin throws and the service catches the exception then
    // // emits an action to reset the auth step then emits a problem with info
    // // about the exception
    // expect(
    //     service.googleSignInStream,
    //     emitsInOrder(<dynamic>[
    //       TypeMatcher<SetAuthStepAction>()
    //         ..having((a) => a.step, 'step', 1),
    //       TypeMatcher<SetAuthStepAction>()
    //         ..having((a) => a.step, 'step', 0),
    //       TypeMatcher<AddProblemAction>()
    //         ..having((p) => p.info.message, 'message',
    //             equals('Exception: GoogleSignIn.signIn')),
    //       emitsDone,
    //     ]));
  });

  test('_signInWithApple starts signin sequence and dispatches emitted actions',
      () async {
    // // setup a mock auth service to give a test response
    // final mockAuthService = MockAuthService();
    // when(mockAuthService.appleSignInStream).thenAnswer(
    //   (_) => Stream.fromIterable(
    //       [SetAuthStepAction(1), AddProblemAction(Problem(message: 'm'))]),
    // );

    // final store = FakedOutStore(authService: mockAuthService);

    // // dispatch action to initiate signin
    // store.dispatch(SigninWithAppleAction());

    // // verify the middleware used the service to get a stream of actions
    // verify(mockAuthService.appleSignInStream);

    // // wait for the stream to complete so we can test that the middleware did it's thing
    // await for (ReduxAction _ in mockAuthService.appleSignInStream) {}

    // // all the middleware does is dispatch a StoreAuthState action so check the state
    // expect(store.state.authStep, 1);
    // expect(store.state.problems.length, 1);
  });

  test('appleSignInStream resets auth steps on cancel', () {
    // final service = AuthService(
    //     FakeFirebaseAuth1(), FakeGoogleSignIn(), FakeAppleSignInCancels());

    // // the service should set auth step to 1 (signing in with apple)
    // // then due to user cancel the service should reset the auth step to 0
    // final expectedAuthSteps = [1, 0];

    // // check that the stream emits the expected value
    // service.appleSignInStream.listen(expectAsync1((action) {
    //   expect((action as SetAuthStepAction).step,
    //       expectedAuthSteps.removeAt(0));
    // }, count: 2));
  });

  test('appleSignInStream emits StoreAuthStep actions at each stage', () {
    // final service = AuthService(
    //     FakeFirebaseAuth1(), FakeGoogleSignIn(), FakeAppleSignIn());

    // // the service should set auth step to 1 (signing in with apple)
    // // then 2 (signing in with Firebase) then reset to 0
    // final expectedAuthSteps = [1, 2, 0];

    // service.appleSignInStream.listen(expectAsync1((action) {
    //   // the last action is a problem due to not having valid credentials
    //   // in the mock object returned by the service
    //   if (expectedAuthSteps.isEmpty) {
    //     expect(action is AddProblemAction, true);
    //   } else {
    //     expect((action as SetAuthStepAction).step,
    //         expectedAuthSteps.removeAt(0));
    //   }
    // }, count: 4));
  });

  // test that errors are handled by being passed to the store
  test('appleSignInStream catches errors and emits StoreProblem actions',
      () async {
    // final service = AuthService(
    //     FakeFirebaseAuth1(), FakeGoogleSignIn(), FakeAppleSignInThrows());

    // // the service will emit step 1 indicating apple signin is occuring
    // // the apple signin throws and the service catches the exception then
    // // emits an action to reset the auth step then emits a problem with info
    // // about the exception
    // expect(
    //     service.googleSignInStream,
    //     emitsInOrder(<dynamic>[
    //       TypeMatcher<SetAuthStepAction>()
    //         ..having((a) => a.step, 'step', 1),
    //       TypeMatcher<SetAuthStepAction>()
    //         ..having((a) => a.step, 'step', 0),
    //       TypeMatcher<AddProblemAction>()
    //         ..having((p) => p.info.message, 'message',
    //             equals('Exception: AppleSignIn.signIn')),
    //       emitsDone,
    //     ]));
  });
}
