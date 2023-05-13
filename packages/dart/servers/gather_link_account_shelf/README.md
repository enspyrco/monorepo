# gather_link_account_shelf

Missing files:

- `lib/config/secret.dart` contains:

```dart
const clientSecret = '...';
```

The secret can be found in the GitHub OAuth app page, eg. <https://github.com/settings/applications/1941750>

This [shelf](https://pub.dev/packages/shelf) server handles HTTP GET requests via
several routes. There is also a Dockerfile for running with [Docker](https://www.docker.com/).

## Deploy to Firebase Hosting

```sh
firebase deploy --only hosting
```

## Running locally with `dart run`

```sh
dart run bin/server.dart
```

## Running locally with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```sh
docker build . -t myserver
docker run -it -p 8080:8080 myserver
```

## Sending a request

From another terminal:

```sh
curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

If running in Docker, the logs are in the first terminal:

```sh
2021-05-06T15:47:04.620417  0:00:00.000158 GET     [200] /
2021-05-06T15:47:08.392928  0:00:00.001216 GET     [200] /echo/I_love_Dart
```
