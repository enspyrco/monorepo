import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../../native/libgit2_bindings.dart';

class GitService {
  GitService({String? repoPath})
      : _nativeLib = LibGit2(DynamicLibrary.open('libgit2.1.5.0.dylib')) {
    // https://libgit2.org/libgit2/#HEAD/group/libgit2/git_libgit2_init
    //
    // returns	the number of initializations of the library, or an error code.
    //
    // May be called multiple times - it will return the number of times the
    // initialization has been called (including this one) that have not
    // subsequently been shutdown.
    int result = _nativeLib.git_libgit2_init();
    // TODO: check for error in result
  }

  final LibGit2 _nativeLib;
  late final Pointer<Pointer<git_repository>> _repoPtrPtr;

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

  void openRepository(String repoPath) {
    Pointer<Char> pathPtr = repoPath.toNativeUtf8().cast<Char>();

    _repoPtrPtr = calloc<Pointer<git_repository>>();

    int result = _nativeLib.git_repository_open(_repoPtrPtr, pathPtr);
    if (result < 0) {
      throw Exception('$result : failed opening repository');
    }

    calloc.free(pathPtr);
  }

  String getRepoPath() {
    return _nativeLib
        .git_repository_path(_repoPtrPtr.value)
        .cast<Utf8>()
        .toDartString();
  }

  CommitTreeState getCommitTree() {
    _nativeLib.git_tree_walk(tree, mode, callback, payload)
  }

  void dispose() {
    _nativeLib.git_repository_free(_repoPtrPtr.value);
  }
}
