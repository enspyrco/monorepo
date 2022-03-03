# Optional Style Guide

[< README]

## Recommended project structure

`lib` contains only:

- `main.dart`
- `app_state.dart`
- feature folders
- generated files `firebase_options.dart` & `redfire_options.dart`

Have a `home` feature with a `HomePage`, shown on successful authentication.

All pages in `lib/<feature>/pages/`

- eg. `home_page.dart` in `lib/home/pages`

Have a `shared` section for things that don't belong in a single place and there is no other section that makes sense.

Use a feature-first structure or for larger apps, a section/feature-first structure with redux components, ie. lib/auth/actions, lib/auth/reducers, etc.

- see: [Feature-first or Function-first folder structure? - New_flutter_template](https://issueexplorer.com/issue/brianegan/new_flutter_template/10)

... etc.

[< README]: ../../README.md
