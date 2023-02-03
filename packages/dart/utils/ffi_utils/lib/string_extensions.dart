import 'dart:ffi';

import 'package:ffi/ffi.dart';

extension StringExt on String {
  /// Convert a Dart string to a UTF-8 encoded C string.
  Pointer<Char> toCStringWithAllocate() => toNativeUtf8().cast<Char>();
}

extension CharPointerExt on Pointer<Char> {
  /// Convert a UTF-8 encoded C string to a Dart string.
  String toDartString({int? length}) =>
      cast<Utf8>().toDartString(length: length);
}
