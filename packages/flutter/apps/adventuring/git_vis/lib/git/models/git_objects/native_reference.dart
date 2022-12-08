import 'dart:ffi';

import 'package:astro_locator/astro_locator.dart';

import '../../native_bindings/libgit2_bindings.dart';

// https://git-scm.com/book/en/v2/Git-Internals-Git-References

class NativeReference implements Finalizable {
  NativeReference._(this._nativePointer);

  factory NativeReference.create(Pointer<git_reference> referencePtr) {
    final reference = NativeReference._(referencePtr);

    _finalizer.attach(reference, referencePtr.cast(), detach: reference);

    return reference;
  }

  /// The native resource, should be closed exactly once.
  final Pointer<git_reference> _nativePointer;

  /// Used to prevent double freeing and usage after close.
  bool _freed = false;

  static final _finalizer =
      NativeFinalizer(locate<LibGit2>().addresses.git_reference_free.cast());

  /// Free the memory for this reference
  void free() {
    if (_freed) return;

    _freed = true;
    _finalizer.detach(this);
    locate<LibGit2>().git_reference_free(_nativePointer);
  }
}
