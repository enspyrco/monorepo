import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../native_bindings/libgit2_bindings.dart';

class BranchesIterator {
  BranchesIterator(LibGit2 nativeLib, Pointer<git_repository> repoPtr)
      : _nativeLib = nativeLib {
    _branchIteratorPtrPtr = calloc<Pointer<git_branch_iterator>>();

    _nativeLib.git_branch_iterator_new(
        _branchIteratorPtrPtr, repoPtr, git_branch_t.GIT_BRANCH_ALL);

    _branchIteratorPtr = _branchIteratorPtrPtr.value;
  }

  /// The following fields hold a native branches iterator, in two forms (* and **)
  /// for convenience.
  /// Memory management is left to the caller - each call to [createBranchesIterator]
  /// must have a corresponding call to [freeBranchesIterator].
  late final Pointer<Pointer<git_branch_iterator>> _branchIteratorPtrPtr;
  late final Pointer<git_branch_iterator> _branchIteratorPtr;

  late final LibGit2 _nativeLib;

  Pointer<git_reference> getNextBranch() {
    Pointer<Pointer<git_reference>> referencePtPtr =
        calloc<Pointer<git_reference>>();

    Pointer<Int32> outType = calloc<Int32>()
      ..value = git_branch_t.GIT_BRANCH_ALL;

    _nativeLib.git_branch_next(referencePtPtr, outType, _branchIteratorPtr);

    return referencePtPtr.value;
  }

  void free() {
    calloc.free(_branchIteratorPtrPtr);
  }
}
