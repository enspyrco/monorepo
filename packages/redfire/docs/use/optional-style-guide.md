# Optional Style Guide

[< README]

## Recommended project structure

Only `main.dart` and `app_state.dart` at top level

- you will be updating both frequently so finding them really easily is a time/flow-saver

`main_page.dart` in `lib/shared/pages`

- it is poor reasoning, but shared is a section for things that don't belong in a single place and there is no other section that makes sense
- app-init or something similar might be a better section but after experimenting, shared was where I kept going to find main_page.dart
- [ ]  what about home/pages/home_page.dart ?

Use a feature-first structure or for larger apps, a section/feature-first structure with redux components, ie. lib/auth/actions, lib/auth/reducers, etc.

- see: [Feature-first or Function-first folder structure? - Brianegan/New_flutter_template](https://issueexplorer.com/issue/brianegan/new_flutter_template/10)

... etc.

[< README]: ../../README.md
