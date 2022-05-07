# flutter_box2d_web

## Testing

This package uses `package:integration_test` to run its tests in a web browser.

To run web integration tests:

1. Check what version of Chrome is running on the machine the tests are running on.

2. Download and install the ChromeDriver for that version from [here](https://chromedriver.chromium.org/downloads)

3. Start ChromeDriver with:

    ```sh
    chromedriver --port=4444
    ```

4. Run tests:

    `cd` into the `example` directory, then run:

    ```sh
    flutter drive \
      --driver test_driver/integration_test.dart \
      --target integration_test/flutter_box2d_web_test.dart \
      -d web-server
    ```

The web package contains a standard `test` directory in the root of the package that can be run with `flutter test`, mimicking the flutter/plugins structure, and the test there just directs users to the Integration Tests that live in the `example` directory.

See [Flutter wiki > Plugin Tests > Web Tests] for instructions to setup and run tests and for more general info.

References

- [Enspyr Notes > Testing Plugins]
- [Flutter wiki > Plugin Tests > Web Tests]
- [flutter.dev > Integration testing]

[Enspyr Notes > Testing Plugins]: https://www.notion.so/reference-material/Testing-Plugins-a2c20ea558074390a1da9521afd2c74f
[Flutter wiki > Plugin Tests > Web Tests]: https://github.com/flutter/flutter/wiki/Plugin-Tests#web-tests
[flutter.dev > Integration testing]: https://flutter.dev/docs/testing/integration-tests
