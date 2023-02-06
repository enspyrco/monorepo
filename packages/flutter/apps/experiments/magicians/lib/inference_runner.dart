// import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart' as tflite;
import 'package:magicians/models/tflite_model.dart';

import 'models/keypoints.dart';

class InferenceRunner {
  InferenceRunner({required this.notifier});

  final ValueNotifier<List<Keypoint>> notifier;

  late tflite.Interpreter _interpreter;
  // final ReceivePort _receivePort = ReceivePort();
  // late final Isolate _longRunningIsolate;
  // bool _busy = false;

  void load(TfliteModel model, inputWidth, inputHeight) async {
    // Load the model & create the interpreter.
    _interpreter = tflite.createInterpreter(
      pathToModel: model.path,
      numThreads: 2,
    );

    // Reshape input tensor to fit our image & allocate tensors
    _interpreter.reshapeInputTensor(shape: [1, inputWidth, inputHeight, 3]);
    _interpreter.allocateTensors();
  }

  // Future<void> load(TfliteModel model) async {
  //   _longRunningIsolate =
  //       await Isolate.spawn(_inferenceTask, _receivePort.sendPort);
  //   _receivePort.sendPort.send(model.path);
  // }

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

  // runInferenceOn(Uint8List rgbBytes) {
  //   _receivePort.sendPort.send(rgbBytes);
  // }

  // void _inferenceTask(SendPort p) async {
  //   print('Spawned isolate started.');

  //   tflite.Interpreter? interpreter;

  //   // Send a SendPort to the main isolate so it can send rgb data to this isolate.
  //   final commandPort = ReceivePort();
  //   p.send(commandPort.sendPort);

  //   // Wait for data from the main isolate.
  //   await for (final data in commandPort) {
  //     if (data == null) {
  //       // Exit if the main isolate sends a null message, indicating there are no
  //       // more rgb data to run inference on.
  //       break;
  //     }
  //     if (data is String) {
  //       print('Isolate received model path: $data.');
  //       // Load the model & create the interpreter.
  //       interpreter = tflite.createInterpreter(
  //         pathToModel: data,
  //         numThreads: 2,
  //       );
  //     }
  //     if (data is Uint8List) {
  //       // message is rgb data
  //       if (!_busy) {
  //         print('Isolate received data and is now busy.');
  //         _busy = true;

  //         if (interpreter == null) {
  //           // TODO: handle error
  //           break;
  //         }

  //         interpreter.setInputTensorData(data);
  //         interpreter.invoke();
  //         List<double> inferredData = interpreter.getOutputTensorData<double>();

  //         List<Keypoint> keypoints = [];
  //         for (int i = 0; i < 17 * 3; i += 3) {
  //           keypoints.add(Keypoint(
  //               inferredData[i + 1], inferredData[i], inferredData[i + 2]));
  //         }

  //         // Send the result to the main isolate.
  //         // p.send(keypoints);

  //         // TODO: will this work?
  //         notifier.value = keypoints;

  //         _busy = false;
  //       } else {
  //         print('Isolate received data but was already busy.');
  //       }
  //     }
  //   }

  //   print('Spawned isolate finished.');
  //   Isolate.exit();
  // }
}
