import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter_tflite_ffi/flutter_tflite_ffi.dart';
import 'package:flutter_tflite_ffi/src/flutter_tflite_ffi_bindings_generated.dart';

extension StringExt on String {
  /// Convert a Dart string to a UTF-8 encoded C string.
  Pointer<Char> toCString() => toNativeUtf8().cast<Char>();
}

extension CharPointerExt on Pointer<Char> {
  /// Convert a UTF-8 encoded C string to a Dart string.
  String toDartString({int? length}) =>
      cast<Utf8>().toDartString(length: length);
}

/// The TfLiteTensor struct has the following:
// // The data type specification for data stored in `data`. This affects
// // what member of `data` union should be used.
// TfLiteType type;
// // A union of data pointers. The appropriate type should be used for a typed
// // tensor based on `type`.
// TfLitePtrUnion data;
extension TfLiteTensorPointerExt on Pointer<TfLiteTensor> {
  toInfo() => TensorInfo(
      bytes: ref.bytes,
      typeInt: ref.type,
      isVariable: ref.is_variable,
      name: ref.name.toDartString());
}
