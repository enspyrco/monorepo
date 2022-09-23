# process-articles-in-emails

*A Dart microservice that processes & saves articles in emails.*

[Project Notes](https://www.notion.so/enspyrco/process-articles-in-emails-16bcb39cceee47a8b6e02a5e47e86782)

Assumptions:

- The microservice will be run on Cloud Run
- Emails are being pushed to the microservice as PubSub messages, for example see:
  - [Connect a PubSub topic to Cloud Run]
  - [Connect your GMail to a PubSub topic]

The server app is built using [Shelf], and is ultimately run inside a [Docker] container on [Cloud Run].

For info on prototyping, testing & deploying see:

- [Run & debug a shelf server locally]
- [Deploy a shelf server to Cloud Run]
- [Test a shelf server that runs on Cloud Run]

[Shelf]: https://pub.dev/packages/shelf
[Docker]: https://www.docker.com/
[Cloud Run]: https://cloud.google.com/run
[Connect a PubSub topic to Cloud Run]: https://reference-material.notion.site/Connect-a-PubSub-topic-to-Cloud-Run-fd91b07419d5434bbf1e92b95b3b0930
[Connect your GMail to a PubSub topic]: https://reference-material.notion.site/Connect-your-GMail-to-a-PubSub-topic-3abdc0aee07042a9937a0c34eea46fca
[Run & debug a shelf server locally]: https://reference-material.notion.site/Run-debug-a-shelf-server-locally-b80329316e444cb2baa9c199ceafdfed
[Deploy a shelf server to Cloud Run]: https://reference-material.notion.site/Deploy-a-shelf-server-to-Cloud-Run-c060399528d344ab87fca6d0aa26e90d
[Test a shelf server that runs on Cloud Run]: https://reference-material.notion.site/Test-a-shelf-server-that-runs-on-Cloud-Run-96d7921e07314956bcf6878d774732fb
