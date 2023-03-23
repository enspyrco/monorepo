# flutter_box2d_example

Demonstrates how to use the flutter_box2d plugin.

## Using the example during prototyping

To deploy locally: from the example folder, run:

```sh
flutter build web
firebase emulators:start
```

## Integration Tests

### Running on web

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
      --target integration_test/flutter_box2d_test.dart \
      -d web-server
    ```
