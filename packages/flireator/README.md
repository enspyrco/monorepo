# flireator

[< monorepo](../../README.md)

*A Flutter plugin for creating & managing projects built using Dart, Flutter, & Firebase.*

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

## Scripts

Shell scripts for managing the monorepo were not being used so moved from top-level of the monorepo into flireator:

- run_clean.sh
- run_code_gen.sh
- run_upgrade.sh

The scripts will be used when starting processes from flireator.
