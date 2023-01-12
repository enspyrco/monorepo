# astro_test_utils

*Helper classes for testing apps that use `astro`.*

Basic usage:

```dart
var harness = WidgetTestHarness<AppState>(
  initialState: AppState.initial,
  innerWidget: AWidgetUnderTest(),
);

await tester.pumpWidget(harness.widget);

expect(somePrecondition, isAsExpected);

harness.land(const AMission());

await tester.pumpAndSettle();

expect(harness.state.part, hasChangedAsWeExpect);
```

## Features

### Test Harness

A TestHarness that wraps a widget under test in a StoreProvider.

## Conventions

### App State Test Doubles

Currently we (as users of astro_test_utils) create AppState test doubles
in our apps, as the AppState type is not known to astro_test_utils.

So, to provide the tests with an AppState that uses test double for its members,
we add a file, eg. `test/test-doubles/state/app_state_test_doubles.dart`:

```dart
AppState initialAppState = GeneratedAppState(
  navigation: DefaultNavigationState.initial,
  auth: AuthStateTestDouble(
    user: UserAuthStateTestDouble(signedIn: SignedInState.checking),
  ),
  error: DefaultErrorHandlingState.initial,
);

AppState signedInAppState = AppState(
  navigation: DefaultNavigationState.initial,
  auth: AuthStateTestDouble(
    user: UserAuthStateTestDouble(signedIn: SignedInState.signedIn, uid: 'uid'),
  ),
  error: DefaultErrorHandlingState.initial,
);
```

This will probably be replaced with a source gen solution in the future.

## Stubbing vs. Mocking

The astro_test_utils package provides classes for stubbing services but nothing in the way of mocks.
You can always use Mockito or the like yourself but consider whether stubs might suffice and (perhaps
controversial) whether to avoid mocks in general.

> If you have adequate discipline or insight to resist the siren call of mocks and their introspection
> capabilities then there probably is nothing to worry about. I know for myself, from refactoring my own
> code, that using mocks tends to increase the complexity of my tests while lowering the 'quality', by
> encouraging testing implementation over behaviour.
>
Essentially, consider other test doubles before mocks.

- What other test doubles?
  - See: <http://blog.cleancoder.com/uncle-bob/2014/05/14/TheLittleMocker.html>

## Stubbed Services

Currently we use the strategy of having interfaces for each service, and we depend on the interface here so that we can create eg. a StubbedMyService class that allows for easy setting up of a stubbed service during tests.

Another option might be to have separate myservice_test_utils packages but the first strategy seems adequate for now.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
