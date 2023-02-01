import 'dart:ffi';
import 'dart:io';

import 'flutter_tflite_ffi_bindings_generated.dart';

// There is an issue with ffigen, causing the enum to be erased and turned an int
// so we use a typedef for now and will replace it with the correct generated enum
// when the problem in ffigen has been resolved.
typedef TFLiteStatusInt = int;

const String _libName = 'libtensorflowlite_c';

final DynamicLibrary _dylib = () {
  if (Platform.environment.containsKey('FLUTTER_TEST')) {
    const testLibPath = 'test/libtensorflowlite_c.dylib';

    if (!Platform.isMacOS) {
      throw 'Tests currently use $testLibPath and check for FLUTTER_TEST '
          'so only work when using flutter_test on macos, PRs welcome!';
    }
    return DynamicLibrary.open(testLibPath);
  }
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

/// We have a single global bindings object for now, which will change when
/// we move to the new static interop world.
final bindingsGlobal = FlutterTfliteFfiBindings(_dylib);
