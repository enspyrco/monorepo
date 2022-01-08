# flutter-ci-tools

A Docker container built from the cirrusci/flutter image, with various CI tools.

> [Project Notes](https://enspyrco.notion.site/flutter-ci-tools-2685a4251b11427faebb5d311ae66ad8)

With the available tools you can:

- deploy coverage data to Firebase Hosting
- update README badges as coverage changes

Future Work

- Add a comment to the PR with the coverage and whether it is a passing number.

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
  
    container: cirrusci/flutter:2.8.1
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
    container: enspyrco/flutter-ci-tools:2.8.1

    steps:
      - uses: actions/download-artifact@v2
        with:
          path: ./coverage
    
      - run: /deploy_coverage -k '${{secrets.FIREBASE_SERVICE_ACCOUNT}}' -p firebase_project_id
```

## Dart Apps

### deploy_coverage

**Deploy coverage info to Firebase hosting.**

### calculate_percentage

**Calculate percentage of lines covered from coverage info.**

## Flutter App

### draw_badge

**Draw a badge for the given coverage percent and save as a png file.**
