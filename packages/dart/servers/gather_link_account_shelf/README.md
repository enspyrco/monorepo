# gather_link_account_shelf

This [shelf](https://pub.dev/packages/shelf) server handles HTTP GET requests via
several routes. There is also a Dockerfile for running with [Docker](https://www.docker.com/).

## Running locally with `dart run`

```sh
dart run bin/server.dart
```

And then from a second terminal:

```sh
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

## Running locally with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```sh
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```

And then from a second terminal:

```sh
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

You should see the logging printed in the first terminal:

```sh
2021-05-06T15:47:04.620417  0:00:00.000158 GET     [200] /
2021-05-06T15:47:08.392928  0:00:00.001216 GET     [200] /echo/I_love_Dart
```

## Running the Firebase Emulator

If we use `await locator.provideLocalFirestore();` to provide a Firetore Service to the
locator, our server will connect the local Firestore Emulator.

To start the emulator, from the project directory:

```sh
firebase emulators:start --only firestore --project demo-project
```
