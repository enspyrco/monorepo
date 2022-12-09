import 'dart:ffi';

import 'package:astro_locator/astro_locator.dart';

import '../../extensions/extensions.dart';
import '../../native_bindings/libgit2_bindings.dart';

// https://git-scm.com/book/en/v2/Git-Internals-Git-References

class NativeReference implements Finalizable {
  NativeReference._(this._nativePointer) : _nativeLib = locate<LibGit2>();

  factory NativeReference.create(Pointer<git_reference> referencePtr) {
    final reference = NativeReference._(referencePtr);

    _finalizer.attach(reference, referencePtr.cast(), detach: reference);

    return reference;
  }

  final LibGit2 _nativeLib;

  /// The native resource, should be closed exactly once.
  final Pointer<git_reference> _nativePointer;

  /// Used to prevent double freeing and usage after close.
  bool _freed = false;

  static final _finalizer =
      NativeFinalizer(locate<LibGit2>().addresses.git_reference_free.cast());

  /// Get the type of a reference - either direct or symbolic.
  int get referenceType => _nativeLib.git_reference_type(_nativePointer);

  /// Get the OID pointed to by a direct reference.
  ///
  /// Only available if the reference is direct (i.e. an object id reference, not
  /// a symbolic one).
  Pointer<git_oid> get target =>
      _nativeLib.git_reference_target(_nativePointer);

  /// Get the full name of a reference.
  String get name {
    return _nativeLib.git_reference_name(_nativePointer).toDartString();
  }

  /// Get the reference's short name.
  ///
  /// This will transform the reference name into a name "human-readable" version.
  /// If no shortname is appropriate, it will return the full name.
  String get shorthand {
    return _nativeLib.git_reference_shorthand(_nativePointer).toDartString();
  }

  /// Free the memory for this reference object.
  void free() {
    if (_freed) return;

    _freed = true;
    _finalizer.detach(this);
    _nativeLib.git_reference_free(_nativePointer);
  }
}
