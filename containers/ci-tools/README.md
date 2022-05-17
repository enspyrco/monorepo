# ci-tools

A Docker container with the flutter tool & various CI tools installed in a minimal ubuntu image.

The container uses Flutter stable, currently version 3.0.0. If Flutter has released a new version (see [SDK releases](https://docs.flutter.dev/development/tools/sdk/releases)) this repo should be updated with a PR that changes the version number in this text to the new version. The CI will do the rest.

> [Project Notes]

With the available tools you can:

- deploy coverage data to Firebase Hosting
- update README badges as coverage changes

Future Work

- Add a comment to the PR with the coverage and whether it is a passing number.

## Setup

[Setup deploying to Firebase]

## Usage

Example: deploying coverage data to Firebase Hosting:

```yml
name: Coverage

on:
  push:
    branches:
      - main

jobs:
  coverage:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        include:
          - package_name: package1
          - package_name: package2
          ...
  
    container: enspyrco/ci-tools:beta
    defaults:
      run:
        working-directory: ./packages/${{ matrix.package_name }}
    
    steps:
      - uses: actions/checkout@v2
      - run: flutter pub get
      - run: flutter test --coverage && genhtml coverage/lcov.info -o coverage
      - uses: actions/upload-artifact@v2
        with:
          name: ${{ matrix.package_name }}
          path: ./packages/${{matrix.package_name}}/coverage/

  upload:
    runs-on: ubuntu-latest
    needs: coverage
    container: enspyrco/ci-tools:stable

    steps:
      - uses: actions/download-artifact@v2
        with:
          path: ./coverage
    
      - run: /deploy_coverage -k '${{secrets.FIREBASE_SERVICE_ACCOUNT}}' -p firebase_project_id
```

## Local Dev

### Building

From the monorepo dir:

```sh
docker build -t citools -f containers/ci-tools/Dockerfile .
```

## Deploying via GitHub Actions workflow

`ci-tools.yml` runs whenever there are changes to files in the relevant folders:

- 'containers/ci-tools/'
- 'packages/flutter-apps/ci-tools/draw_badge/'
- 'packages/cli-apps/ci-tools/deploy_coverage/'

The workflow builds and deploys the image using `docker/build-push-action` with

- context = the monorepo
- file = containers/ci-tools/Dockerfile

> Because the ci-tools container is used in the workflow that deploys the ci-tools container, changes to the container or it's dependencies may require the new version already be deployed. In this situation just deploy the container lcoally before merging the relevant PR.

## Packages

### Dart Apps

#### deploy_coverage

**Deploy coverage info to Firebase hosting.**

#### save_badge_info

**Save project type and coverage percentage to a text file, to be consumed by draw_badge.**

### Flutter App

#### draw_badge

**Draw a badge for the given coverage percent and save as a png file.**

[Project Notes]: https://enspyrco.notion.site/ci-tools-2685a4251b11427faebb5d311ae66ad8
[Setup deploying to Firebase]: docs/firebase_config.md
