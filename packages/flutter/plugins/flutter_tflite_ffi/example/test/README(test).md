# Test data details

## The model

`assets/lite-model_movenet_multipose_lightning_tflite_float16_1.tflite` was downloaded from: [TensorFlow Hub > movenet/multipose/lightning](https://tfhub.dev/google/lite-model/movenet/multipose/lightning/tflite/float16/1)

:warning: The input tensor data type is UInt8 (for TF Lite), listed incorrectly in [TensorFlow Hub > movenet/multipose/lightning](https://tfhub.dev/google/lite-model/movenet/multipose/lightning/tflite/float16/1) but correctly in the [Model card](https://storage.googleapis.com/movenet/MoveNet.MultiPose%20Model%20Card.pdf).

## Input image

`input_image.jpeg` came from the tutorial [MoveNet: Ultra fast and accurate pose detection model.  |  TensorFlow Hub](https://www.tensorflow.org/hub/tutorials/movenet), downloaded with:

`curl -o input_image.jpeg https://images.pexels.com/photos/4384679/pexels-photo-4384679.jpeg --silent`

## The TFLite shared library

Because a test is run in an environment that was not created by the full Flutter build process, the shared library has not been included/linked by the build.

So we added `libtensorflowlite_c.dylib` to `test/` and a check when the plugin loads the shared library to use the file in `test/libtensorflowlite_c.dylib` if the environment indicates the plugin is running in a test.

This seems to be the best option for now, see: [dart-lang/ffi#39](https://github.com/dart-lang/ffi/issues/39)
