# dart-ci-tools

Container built from the official Dart image, with various CI tools written in Dart.

> [Project Notes](https://enspyrco.notion.site/dart-ci-tools-2685a4251b11427faebb5d311ae66ad8)

There are tools available to:

- deploy coverage data to Firebase Hosting

Future Work

- Add a comment to the PR with the coverage and whether it is a passing number.

## Usage

Example: deploying coverage data to Firebase Hosting:

```yml
upload:
    runs-on: ubuntu-latest
    needs: coverage
    container: enspyrco/dart-ci-tools:2.15.1

    steps:
      - uses: actions/download-artifact@v2
        with:
          path: ./coverage

      - run: deploy_coverage ...
```
