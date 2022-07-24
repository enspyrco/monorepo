# firestore_service_googleapis

*Convenience wrappers around the googleapis.dart Firestore API.*

## Example

### Setup

#### Run the Firebase Emulator

From the project directory:

```sh
cd example && firebase emulators:start --only firestore --project demo-project
```

> Using the --project flag with a prefix that starts with `demo-` creates a demo project, ie. no real Firebase configuration and no live resources.

- see: <https://firebase.google.com/docs/emulator-suite/connect_firestore>

### Run

```sh
dart run bin/firestore_service_googleapis_example.dart
```

### Debug

#### VS Code

- Open the project folder in VS Code
- Run the `firestore_service_googleapis_example` launch config

[Notion](https://www.notion.so/enspyrco/googleapis-Firestore-Service-9e12340b0cd44470aedd83c569618082)

<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## Features

- The `FirestoreService` simplifies the process of accessing the Firestore using the `googleapis` package.

## Getting started

TODO: List prerequisites and provide or point to information on how to start using the package.

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
