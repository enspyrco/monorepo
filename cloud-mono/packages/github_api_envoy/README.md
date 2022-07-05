# github_api_envoy

*A microservice that receives authenticated requests and interacts with the GitHub API via a GitHub App.*

- Built with Dart package [Shelf]
- Made to be run in a [Docker] container on [Cloud Run]

For info on prototyping, testing & deploying see:

- [Run & debug a shelf server locally]
- [Deploy a shelf server to Cloud Run]
- [Test a shelf server that runs on Cloud Run]

If you're looking for ways to extend the microservice:

- [Connect a PubSub topic to Cloud Run]

[Shelf]: https://pub.dev/packages/shelf
[Docker]: https://www.docker.com/
[Cloud Run]: https://cloud.google.com/run
[Connect a PubSub topic to Cloud Run]: https://reference-material.notion.site/Connect-a-PubSub-topic-to-Cloud-Run-fd91b07419d5434bbf1e92b95b3b0930
[Run & debug a shelf server locally]: https://reference-material.notion.site/Run-debug-a-shelf-server-locally-b80329316e444cb2baa9c199ceafdfed
[Deploy a shelf server to Cloud Run]: https://reference-material.notion.site/Deploy-a-shelf-server-to-Cloud-Run-c060399528d344ab87fca6d0aa26e90d
[Test a shelf server that runs on Cloud Run]: https://reference-material.notion.site/Test-a-shelf-server-that-runs-on-Cloud-Run-96d7921e07314956bcf6878d774732fb
