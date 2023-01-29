import 'package:ffi/ffi.dart';
import 'package:flutter_tflite_ffi/src/bindings.dart';

export 'src/api/core/interpeter.dart';

String version() => bindings.TfLiteVersion().cast<Utf8>().toDartString();
