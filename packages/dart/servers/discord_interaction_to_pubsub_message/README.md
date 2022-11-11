# discord_interaction_to_pubsub_message

*A microservice that turns Discord Interactions into PubSub messages.*

- Built with Dart package [Shelf]
- Made for running in a [Docker] container on [Cloud Run]

[Project Notes](https://www.notion.so/enspyrco/discord-interaction-to-pubsub-34cd5d2cad0849a5950c80860f0cb6ad)

## Missing files

> Note: this is my best attempt to get the file in working order but the result hasn't been checked yet

`test/data/signature_test_data.dart` is gitignored as it contains sensitive data.

The contents of the file needs to be something like:

```dart
const signature = '...';
const timestamp = '...';
final body = jsonDecode('''...''');
```

- We currently log this data in the handler function of `server.dart`, meaning the [Cloud Run logs for run-dart-code-on-discord](https://console.cloud.google.com/run/detail/us-central1/discord-interaction-to-pubsub-message/logs?project=run-dart-code-on-discord) include signature, timestamp & body
  - the body isn't shown completely but we can get the full string by clicking the text then "Open in Logs Explorer"
- if there are no logs to be found, go to the Discord Server and use /run to interact with the server

[ ] let's get a working `signature_test_data.dart` file, save it somewhere secure then stop logging the signature

## Prototyping, testing & deploying

- [Run & debug a shelf server locally]
- [Deploy a shelf server to Cloud Run]
- [Test a shelf server that runs on Cloud Run]

## Extending the microservice

- [Connect a PubSub topic to Cloud Run]

[Shelf]: https://pub.dev/packages/shelf
[Docker]: https://www.docker.com/
[Cloud Run]: https://cloud.google.com/run
[Connect a PubSub topic to Cloud Run]: https://reference-material.notion.site/Connect-a-PubSub-topic-to-Cloud-Run-fd91b07419d5434bbf1e92b95b3b0930
[Run & debug a shelf server locally]: https://reference-material.notion.site/Run-debug-a-shelf-server-locally-b80329316e444cb2baa9c199ceafdfed
[Deploy a shelf server to Cloud Run]: https://reference-material.notion.site/Deploy-a-shelf-server-to-Cloud-Run-c060399528d344ab87fca6d0aa26e90d
[Test a shelf server that runs on Cloud Run]: https://reference-material.notion.site/Test-a-shelf-server-that-runs-on-Cloud-Run-96d7921e07314956bcf6878d774732fb
