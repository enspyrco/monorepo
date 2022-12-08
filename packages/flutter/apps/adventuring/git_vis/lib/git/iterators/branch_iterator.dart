import 'dart:ffi';

import 'package:astro_locator/astro_locator.dart';
import 'package:ffi/ffi.dart';

import '../models/git_objects/native_reference.dart';
import '../models/native_repository.dart';
import '../native_bindings/libgit2_bindings.dart';

class BranchIterator implements Finalizable {
  BranchIterator._(this._nativePointer) : _nativeLib = locate<LibGit2>();

  factory BranchIterator.create() {
    Pointer<Pointer<git_branch_iterator>> nativePtrPtr =
        calloc<Pointer<git_branch_iterator>>();

    final repo = locate<NativeRepository>();

    int result = locate<LibGit2>().git_branch_iterator_new(
        nativePtrPtr, repo.ptr, git_branch_t.GIT_BRANCH_ALL);
    // TODO check result

    final iterator = BranchIterator._(nativePtrPtr.value);

    _finalizer.attach(iterator, nativePtrPtr.value.cast(), detach: iterator);

    return iterator;
  }

  final LibGit2 _nativeLib;
  final Pointer<git_branch_iterator> _nativePointer;

  /// Used to prevent double freeing and usage after close.
  bool _freed = false;

  static final _finalizer = NativeFinalizer(
      locate<LibGit2>().addresses.git_branch_iterator_free.cast());

  /// Free the memory for this reference
  void free() {
    if (_freed) return;

    _freed = true;
    _finalizer.detach(this);
    locate<LibGit2>().git_branch_iterator_free(_nativePointer);
  }

  NativeReference next() {
    Pointer<Pointer<git_reference>> referencePtPtr =
        calloc<Pointer<git_reference>>();

    Pointer<Int32> outType = calloc<Int32>()
      ..value = git_branch_t.GIT_BRANCH_ALL;

    _nativeLib.git_branch_next(referencePtPtr, outType, _nativePointer);

    return NativeReference.create(referencePtPtr.value);
  }
}
