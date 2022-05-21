# ci-tools

A Docker container setup for Dart & Flutter development & can be used with GitHub Codespaces.

The container uses Flutter stable, currently version 3.0.0. If Flutter has released a new version (see [SDK releases](https://docs.flutter.dev/development/tools/sdk/releases)) this repo should be updated with a PR that changes the version number in this text to the new version. The CI will do the rest.

> [Project Notes]

## Usage

Create `.devcontainer/devcontainer.json` with contents:

```json
{
  "image": "enspyrco/flutter-dev-env:stable",
  "forwardPorts": [3000]
}
```

## Local Dev

### Building

From the monorepo dir:

```sh
docker build -t devenv -f containers/flutter-dev-env/Dockerfile .
```

```sh
docker run -i devenv
```

## Deploying via GitHub Actions workflow

`flutter-dev-env.yml` runs whenever there are changes to files in the relevant folders:

- 'containers/flutter-dev-env/'

The workflow builds and deploys the image using `docker/build-push-action` with

- context = the monorepo
- file = containers/flutter-dev-env/Dockerfile

[Project Notes]: https://www.notion.so/enspyrco/flutter-dev-env-87aa6c1999d9491f9d72dc380df645fe
