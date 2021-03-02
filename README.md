# the_process

A tool to automate "the process".

## Help Docs

[Solutions to Common Problems](docs/common_problems.md)

## Test Cloud Functions Locally

Open the `functions/` folder with VS Code and run the Typescript compiler in watch mode:

> Shift-Cmd-P then "Tasks: Run Build Tasks"

Or

> cd functions && tsc --watch

### Run e2e tests with vscode-jest-runner

> Install [firsttris.vscode-jest-runner](https://github.com/firsttris/vscode-jest-runner).

### Interact with functions via Firebase shell

Run a Cloud Functions shell:

> firebase functions:shell

## Build & Depoy Web

- make sure index.html is the auto version, not the cdn version
- make sure the version of the firebase SDKs matches the flutterfire docs
  - see: <https://firebase.flutter.dev/docs/installation/web>

```sh
flutter build web --no-sound-null-safety
```

```sh
firebase deploy --only hosting 
```

View at: <https://the-process-tool.web.app>

## Run Integration Tests

```sh
remotedev
firebase emulators:start
```

- Run a `tsc` build task to watch for file changes
- Open a browser to <http://localhost:8000>
- Open a browser to <http://localhost:4000>
- Run launch config: `the_rdt_process`

```sh
flutter drive --driver=test/driver/integration_test.dart --target=test/sections/3-create-a-section/integration_tests/create_a_section_test.dart -d 
```

```sh
flutter drive --driver=test/driver/integration_test.dart --target=test/sections/3-create-a-section/integration_tests/create_a_section_test.dart -d web-server
```
