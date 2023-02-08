import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart' as tflite;
import 'package:magicians/inference_runner.dart';
import 'package:magicians/models/tflite_model.dart';
import 'package:magicians/models/keypoints.dart';

class InferenceRunnerIsolate implements InferenceRunner {
  InferenceRunnerIsolate({required this.notifier});

  @override
  final ValueNotifier<List<Keypoint>> notifier;
  final ReceivePort _receivePort = ReceivePort();
  late final SendPort _sendPort = _receivePort.sendPort;
  late final Isolate _longRunningIsolate;
  bool _busy = false;

  @override
  Future<void> load(TfliteModel model, inputWidth, inputHeight) async {
    _longRunningIsolate =
        await Isolate.spawn(_inferenceRunnerIsolateMain, _sendPort);

    _sendPort.send(model.path);
  }

  void _inferenceRunnerIsolateMain(SendPort p) async {
    print('Spawned isolate started.');

    tflite.Interpreter? interpreter;

    // Send a SendPort to the main isolate so it can send rgb data to this isolate.
    final commandPort = ReceivePort();
    p.send(commandPort.sendPort);

    // Wait for data from the main isolate.
    await for (final data in commandPort) {
      if (data == null) {
        // Exit if the main isolate sends a null message, indicating there are no
        // more rgb data to run inference on.
        break;
      }
      if (data is String) {
        print('Isolate received model path: $data.');
        // Load the model & create the interpreter.
        interpreter = tflite.createInterpreter(
          pathToModel: data,
          numThreads: 2,
        );
      }
      if (data is Uint8List) {
        // message is rgb data
        if (!_busy) {
          print('Isolate received data and is now busy.');

          _busy = true;

          if (interpreter == null) break; // TODO: handle error

          interpreter.setInputTensorData(data);
          interpreter.invoke();
          List<double> inferredData = interpreter.getOutputTensorData<double>();

          List<Keypoint> keypoints = [];
          for (int i = 0; i < 17 * 3; i += 3) {
            keypoints.add(Keypoint(
                inferredData[i + 1], inferredData[i], inferredData[i + 2]));
          }

          // Send the result to the main isolate.
          // p.send(keypoints);

          // TODO: will this work?
          notifier.value = keypoints;

          _busy = false;
        } else {
          print('Isolate received data but was already busy.');
        }
      }
    }

    print('Spawned isolate finished.');
    Isolate.exit();
  }

  @override
  runInferenceOn(Uint8List rgbBytes) {
    _sendPort.send(rgbBytes);
  }
}
