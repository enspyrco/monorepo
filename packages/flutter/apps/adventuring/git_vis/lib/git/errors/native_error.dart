import 'dart:ffi';

import '../extensions/extensions.dart';
import '../native_bindings/libgit2_bindings.dart';

/// Details of the last error that occurred while using the LibGit2 C library.
class NativeError {
  NativeError(this._errorPointer);

  final Pointer<git_error> _errorPointer;

  @override
  String toString() => _errorPointer.ref.message.toDartString();
}
