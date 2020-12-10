# the_process

A tool to automate "the process".

## Test Cloud Functions Locally

Run a `tsc` build task to watch for file changes:
> Shift-Cmd-P then "Tasks: Run Build Tasks"
Or
> cd functions && tsc --watch

Run a Cloud Functions shell:
> firebase functions:shell

### Steps

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
