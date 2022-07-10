# firestore_api_client_example

A simple CLI app that shows how to use the `firestore_api_client` package.

## Setup

### Firebase Emulator

```sh
cd <project_dir>
firebase emulators:start --only firestore --project demo-project
```

Using the --project flag with a prefix that starts with `demo-` creates a demo project, ie. no real Firebase configuration and no live resources.

- see: <https://firebase.google.com/docs/emulator-suite/connect_firestore>