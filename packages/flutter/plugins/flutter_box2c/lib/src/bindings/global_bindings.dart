import 'dart:ffi';
import 'dart:io';

import 'generated_bindings.dart';

const String _libName = 'flutter_box2c';

/// The dynamic library in which the symbols for [FlutterBox2cBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final FlutterBox2cBindings globalBindings = FlutterBox2cBindings(_dylib);
