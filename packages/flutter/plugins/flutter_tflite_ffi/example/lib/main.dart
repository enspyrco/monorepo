import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart' as tflite;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _version = '?';
  late tflite.Interpreter _interpreter;

  @override
  void initState() {
    super.initState();
    _version = 'TFLite version: ${tflite.version()}';

    // Create the interpreter.
    _interpreter = tflite.createInterpreter(
      pathToModel: '/path/to/model.tflite',
      numThreads: 2,
    );

    // Allocate tensors and populate the input tensor data.
    _interpreter.allocateTensors();
  }

  Uint8List _runInference(Uint8List imageData) {
    _interpreter.populateInputTensor(data: imageData);

    // Execute inference.
    _interpreter.invoke();

    // Extract the output tensor data.
    return _interpreter.copyOutputTensorData();
  }

  /// Assets are not individually stored on disk but together in a single asset
  /// bundle so we extract the model, save it as an individual file and return
  /// the path.
  Future<String> _extractModelFromBundle() async {
    Directory directory = await getApplicationDocumentsDirectory();
    ByteData data = await rootBundle.load('assets/model_metadata.tflite');
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    final file = File('${directory.path}/model_metadata.tflite')
      ..writeAsBytesSync(bytes);

    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Native Packages'),
          ),
          body: FutureBuilder<String>(
              future: _extractModelFromBundle(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Snapshot has no data');
                }

                _interpreter =
                    tflite.createInterpreter(pathToModel: snapshot.data!);

                return Column(
                  children: [
                    Text(_version),
                    Text('inputs: ${_interpreter.inputTensorCount}\n'
                        'outputs: ${_interpreter.outputTensorCount}'),
                  ],
                );
              })),
    );
  }

  @override
  void dispose() {
    // Dispose of the interpreter (along with model & tensors)
    _interpreter.delete();
    super.dispose();
  }
}
