import 'dart:ffi';

import 'package:astro_locator/astro_locator.dart';
import 'package:ffi/ffi.dart';

import '../iterators/branch_iterator.dart';
import '../models/git_objects/native_reference.dart';
import '../models/native_repository.dart';
import '../native_bindings/libgit2_bindings.dart';

class GitService {
  GitService({String? repoPath})
      : _nativeLib = LibGit2(DynamicLibrary.open('libgit2.1.5.0.dylib')) {
    int result = _nativeLib.git_libgit2_init();
    // TODO: check for error in result
    // May be called multiple times.
    // result = the number of initializations of the library not shut down,
    // or an error code.

    if (repoPath != null) {
      Locator.add<NativeRepository>(NativeRepository.create(repoPath));
    }

    Locator.add<LibGit2>(_nativeLib);
  }

  final LibGit2 _nativeLib;
  BranchIterator? _branchIterator;

  String libgit2Version() {
    final majorPtr = calloc<Int>();
    final minorPtr = calloc<Int>();
    final revPtr = calloc<Int>();

    final result = _nativeLib.git_libgit2_version(majorPtr, minorPtr, revPtr);

    if (result != 0) {
      throw Exception('$result : failed getting libgit2 version');
    } else {
      String version = '${majorPtr.value}.${minorPtr.value}.${revPtr.value}.';

      calloc.free(majorPtr);
      calloc.free(minorPtr);
      calloc.free(revPtr);

      return version;
    }
  }

  void openRepository(String path) {
    final repo = NativeRepository.create(path);
    Locator.add<NativeRepository>(repo);
  }

  void createBranchIterator() {
    _branchIterator = BranchIterator.create();
  }

  NativeReference nextBranch() => _branchIterator!.next();
}
