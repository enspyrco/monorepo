# flireator

[< monorepo](../../README.md)

*A project creation tool for Flutter projects with a Firebase backend, stored on GitHub.*

[Project Notes](https://enspyrco.notion.site/Flireator-b8ec37f83eab4b268d8672fc715628f1)

## Sections

### GitHub

- create a github repo
- create a commit for each flutter and firebase component

### Flutter

- create a Flutter project
- download dependencies

### Firebase

- create a project
- add backend components (auth, database, cloud functions, etc)
- download config files

## Common Commands

```sh
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch --delete-conflicting-outputs
redux-devtools --open
flutter drive --dart-define=RDT=true --target=test_driver/app.dart
firebase emulators:start --project flireator --import=test/data
http://localhost:4000
```
