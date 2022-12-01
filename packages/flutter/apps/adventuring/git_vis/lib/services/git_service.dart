import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../src/bindings/libgit2_bindings.dart';

class GitService {
  GitService({required String repoPath})
      : _nativeLib = LibGit2(DynamicLibrary.open('libgit2.1.5.0.dylib')),
        _repoPath = repoPath {
    // https://libgit2.org/libgit2/#HEAD/group/libgit2/git_libgit2_init
    //
    // returns	the number of initializations of the library, or an error code.
    //
    // May be called multiple times - it will return the number of times the
    // initialization has been called (including this one) that have not
    // subsequently been shutdown.
    int result = _nativeLib.git_libgit2_init();

    Pointer<Char> pathPtr = _repoPath.toNativeUtf8().cast<Char>();

    _repoPtrPtr = calloc<Pointer<git_repository>>();

    result = _nativeLib.git_repository_open(_repoPtrPtr, pathPtr);
    if (result < 0) {
      throw Exception('$result : failed opening repository');
    }

    calloc.free(pathPtr);
  }

  final LibGit2 _nativeLib;
  final String _repoPath;
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

  String getRepoPath() {
    return _nativeLib
        .git_repository_path(_repoPtrPtr.value)
        .cast<Utf8>()
        .toDartString();
  }

  void dispose() {
    _nativeLib.git_repository_free(_repoPtrPtr.value);
  }
}
