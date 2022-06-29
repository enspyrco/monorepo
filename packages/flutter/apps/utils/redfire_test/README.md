# redfire_test

[< monorepo](../../README.md)

*Utilities to simplify testing in apps that use redfire.*

## Setup

Add to `pubspec.yaml`

```yaml
dev_dependencies:
  redfire_test:
    git: https://github.com/enspyrco/redfire_test.git
```

## Using redfire_test

### test-doubles

*Test doubles* have the following types:

**Examples**: commonly used test doubles that are available pre-configured are referred to as *examples* and take the form `ClassNameExample.configuration` eg. `UserExample.nullMembers`

**Mocks**:

**Fakes**:

We aim to follow the test-doubles nomenclature described in [Martin Fowler's 2006 TestDouble article](https://martinfowler.com/bliki/TestDouble.html).

#### Creating example objects

There are two approaches:

1. Use static members of `Stubbed`, eg.
    1. Stubbed.firebaseUser - here we create a Mock then add stubs (sometimes we can't create an Object, eg. firebase.User is a private class)

1. Create an object directly, eg.
    1. AuthUserDataExample

#### Where do test-doubles live?

We have

- a general class that creates different objects: eg. Stubbed in src/test-doubles/stubbed.dart
- examples in a specific file under the area, eg. src/test-doubles/auth/auth_user_data_examples.dart

### tests

#### Where do tests live?

unit-tests

- test a specific ability of a service that is used in different use cases
- reducer/middleware used in > 1 use case

use-case-tests

- follow the flow of a use case, eg. action → dispatch → middleware → reducer
- folder with both unit and integration tests (ie. instrumented/not)

### test-harness

#### WidgetTestHarness

A test harness to wrap a widget under test and provide all the functionality
that a test may want in order to interact with the widget or check for expected
values and behaviour.

```Dart
/// Create the widget under test, wrapped in a [WidgetTestHarness]. We provide an [AppState]
/// with the desired state that will act as the input to the widget under test.
/// In this case we use [WidgetTestHarness.withFakeStore] which creates a [WidgetTestHarness] 
/// with a [FakeStore] that starts with the provided [AppState].
testWidgets('Widget under test shows expected UI', (WidgetTester tester) async {
  
  final testState = AppState.init().copyWith(theModel: SomeModel());

  final harness = WidgetTestHarness.withFakeStore(
    initialState: testState,
    widgetUnderTest: ASuperCoolWidget(),
  );

  await tester.pumpWidget(harness.widget);

  expect(find.byType(AParticularUIWidget), findsOneWidget);
});
```

### Special Goodies

#### Helper function for find.byType

There is a problem with using generic types in `find.ByType`, see [flutter_test find.byType doesn't find generic types · Issue #58876](https://github.com/flutter/flutter/issues/58876).

A solution is to wrap the generic type in a simple function, such as: `Type typeOf<T>() => T;`

This function is defined in `redfire_test` and can be used like this:

```Dart
import 'package:redfire_test/redfire_test.dart';

...

expect(find.byType(typeOf<ABigType<AnotherType>>()), findsOneWidget);
```
