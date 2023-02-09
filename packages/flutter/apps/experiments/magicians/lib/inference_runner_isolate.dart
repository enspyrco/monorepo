import 'dart:isolate';

import 'package:async/async.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart' as tflite;
import 'package:magicians/inference_runner.dart';
import 'package:magicians/interpreter_options.dart';
import 'package:magicians/models/model_extractor.dart';
import 'package:magicians/models/keypoints.dart';

class InferenceRunnerIsolate implements InferenceRunner {
  InferenceRunnerIsolate({required this.notifier});

  @override
  final ValueNotifier<List<Keypoint>> notifier;
  final ReceivePort _receivePort = ReceivePort();
  late final SendPort _sendPort;
  late final StreamQueue<dynamic> _events;
  bool _ready = true;

  @override
  Future<void> load(ModelExtractor model, inputWidth, inputHeight) async {
    await Isolate.spawn(_inferenceRunnerIsolateMain, _receivePort.sendPort);
    // Convert the ReceivePort into a StreamQueue to receive messages from the
    // spawned isolate using a pull-based interface. Events are stored in this
    // queue until they are accessed by `events.next`.
    _events = StreamQueue<dynamic>(_receivePort);

    // The first message from the spawned isolate is a SendPort. This port is
    // used to communicate with the spawned isolate.
    _sendPort = await _events.next;

    _sendPort.send(InterpreterOptions(model.path, inputWidth, inputHeight));
  }

  @override
  runInferenceOn(Uint8List rgbBytes) {
    if (_ready) {
      _ready = false;
      _sendPort.send(rgbBytes);
      _events.next.then((keyPoints) {
        _ready = true;
        notifier.value = keyPoints;
      });
    }
  }
}

void _inferenceRunnerIsolateMain(SendPort p) async {
  print('Isolate spawned.');

  tflite.Interpreter? interpreter;

  // Send a SendPort to the main isolate so it can send rgb data to this isolate.
  final commandPort = ReceivePort();
  p.send(commandPort.sendPort);

  // Wait for data from the main isolate.
  await for (final data in commandPort) {
    if (data == null) {
      print('Isolate received `null`.');
      // Exit if the main isolate sends a null message, indicating there are no
      // more rgb data to run inference on.
      break;
    } else if (data is InterpreterOptions) {
      print('Isolate received model path: $data.');
      // Load the model & create the interpreter.
      interpreter = tflite.createInterpreter(
        pathToModel: data.modelPath,
        numThreads: 4,
      );

      // Reshape input tensor to fit our image & allocate tensors
      interpreter
          .reshapeInputTensor(shape: [1, data.inputWidth, data.inputHeight, 3]);
      interpreter.allocateTensors();
    } else if (data is Uint8List) {
      // message is rgb data
      print('Isolate received rgb data.');

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
      p.send(keypoints);
    } else {
      print('Isolate received ${data.runtimeType}.');
    }
  }

  print('Isolate finished.');
  Isolate.exit();
}
