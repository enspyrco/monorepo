import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:flutter_tflite_ffi/src/extensions.dart';

import 'src/flutter_tflite_ffi_bindings_generated.dart';

const String _libName = 'libtensorflowlite_c';

String version() => _bindings.TfLiteVersion().cast<Utf8>().toDartString();

String getTensorInputAndOutputCount(String modelPath) {
  Pointer<TfLiteModel> model =
      _bindings.TfLiteModelCreateFromFile(modelPath.toCString());
  Pointer<TfLiteInterpreterOptions> optionalOptions =
      Pointer<TfLiteInterpreterOptions>.fromAddress(0);
  Pointer<TfLiteInterpreter> interpreter =
      _bindings.TfLiteInterpreterCreate(model, optionalOptions);
  int inputTensorCount =
      _bindings.TfLiteInterpreterGetInputTensorCount(interpreter);
  int outputTensorCount =
      _bindings.TfLiteInterpreterGetOutputTensorCount(interpreter);

  return '''input count = $inputTensorCount
            output count = $outputTensorCount''';
}

final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.process();
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

final _bindings = FlutterTfliteFfiBindings(_dylib);
