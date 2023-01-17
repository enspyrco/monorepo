import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

import 'flutter_tflite_ffi_bindings_generated.dart';

const String _libName = 'libtensorflowlite_c';

String version() => _bindings.TfLiteVersion().cast<Utf8>().toDartString();

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
