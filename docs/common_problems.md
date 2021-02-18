# Solutions to Common Problems

## Local Development

### Port 8080 is not open on localhost, could not start Firestore Emulator

- terminate Firebase emulator

```sh
lsof -i :8080 
```

> note the pid

```sh
kill <pid>
```

See [article](https://fredriccliver.medium.com/port-8080-is-not-open-on-localhost-could-not-start-firestore-emulator-15c8c367d219)

### Redux Dev Tools on Android

- portfward is required

> make sure platform tools (and thus adb) are on the path - [more info](https://stackoverflow.com/a/28208121)

```sh
adb reverse tcp:8000 tcp:8000
```

### Running firebase emulator gives "Unknown error"

> We can check "firebase-debug.log" for more details but probably just need to run:

```sh
firebase deploy --only functions
```
