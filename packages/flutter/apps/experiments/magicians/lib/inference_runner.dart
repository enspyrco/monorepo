// import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart' as tflite;
import 'package:magicians/models/tflite_model.dart';

import 'models/keypoints.dart';

class InferenceRunner {
  InferenceRunner({required this.notifier});

  final ValueNotifier<List<Keypoint>> notifier;

  late tflite.Interpreter _interpreter;

  Future<void> load(TfliteModel model, inputWidth, inputHeight) async {
    // Load the model & create the interpreter.
    _interpreter = tflite.createInterpreter(
      pathToModel: model.path,
      numThreads: 4,
    );

    // Reshape input tensor to fit our image & allocate tensors
    _interpreter.reshapeInputTensor(shape: [1, inputWidth, inputHeight, 3]);
    _interpreter.allocateTensors();
  }

  runInferenceOn(Uint8List rgbBytes) {
    _interpreter.setInputTensorData(rgbBytes);
    _interpreter.invoke();

    List<double> outputData = _interpreter.getOutputTensorData<double>();
    List<Keypoint> keypoints = [];
    for (int i = 0; i < 17; i++) {
      var offset = i * 3;
      keypoints.add(Keypoint(
          outputData[offset + 1], outputData[offset], outputData[offset + 2]));
    }

    notifier.value = keypoints;
  }
}
