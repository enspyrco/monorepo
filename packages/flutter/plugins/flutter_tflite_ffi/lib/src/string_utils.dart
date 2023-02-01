import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart';
import 'package:flutter_tflite_ffi/src/bindings/flutter_tflite_ffi_bindings_generated.dart';

extension StringExt on String {
  /// Convert a Dart string to a UTF-8 encoded C string.
  Pointer<Char> toCString() => toNativeUtf8().cast<Char>();
}

extension CharPointerExt on Pointer<Char> {
  /// Convert a UTF-8 encoded C string to a Dart string.
  String toDartString({int? length}) =>
      cast<Utf8>().toDartString(length: length);
}
