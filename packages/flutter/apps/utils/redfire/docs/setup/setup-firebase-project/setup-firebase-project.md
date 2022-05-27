# Setup your Firebase project

[< README]

Ensure you have:

## Firebase project & platform apps

Create a new project with the [Firebase console].

Use the [FlutterFire CLI] to create platform apps:

```sh
flutterfire configure
```

Add the generated `firebase_options.dart` to `.gitignore`

## Enable Auth options

- Select "Authentication"
- Hit "Get Started"
- Select Apple -> Enable -> Save
- Select Google -> Enable
  - Update public-facing name
  - Add Project support email
  - Hit Save
- Select Email -> Enable -> Save

## Enable Databases

- Firestore
- RTDB

## Consider changing plans

(optionally) [Update the project to the Blaze plan] - needed for: using Google APIs, etc.

[< README]: ../../../README.md
[Firebase console]: https://console.firebase.google.com/
[FlutterFire CLI]: https://firebase.flutter.dev/docs/cli/
[Update the project to the Blaze plan]: ./update-to-blaze.md
