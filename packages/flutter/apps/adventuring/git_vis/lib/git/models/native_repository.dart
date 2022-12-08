import 'dart:ffi';

import 'package:astro_locator/astro_locator.dart';
import 'package:ffi/ffi.dart';
import 'package:git_vis/git/native_bindings/libgit2_bindings.dart';

class NativeRepository implements Finalizable {
  NativeRepository._(this._nativePointer);

  factory NativeRepository.create(String repoPath) {
    Pointer<Char> pathPtr = repoPath.toNativeUtf8().cast<Char>();

    Pointer<Pointer<git_repository>> repoPtrPtr =
        calloc<Pointer<git_repository>>();

    int result = locate<LibGit2>().git_repository_open(repoPtrPtr, pathPtr);
    if (result < 0) {
      throw Exception('$result : failed opening repository');
    }

    calloc.free(pathPtr);

    final repository = NativeRepository._(repoPtrPtr.value);

    _finalizer.attach(repository, repoPtrPtr.cast(), detach: repository);

    return repository;
  }

  /// The native resource, should be closed exactly once.
  final Pointer<git_repository> _nativePointer;

  Pointer<git_repository> get ptr => _nativePointer;

  /// Used to prevent double freeing and usage after freeing.
  bool _freed = false;

  static final _finalizer =
      NativeFinalizer(locate<LibGit2>().addresses.git_repository_free.cast());

  /// git_repository_path doesn't create new memory, just returns a pointer
  /// to memory held by the repository... struct?
  /// More info : libgit2 > repository.c
  String getRepoPath() {
    return locate<LibGit2>()
        .git_repository_path(_nativePointer)
        .cast<Utf8>()
        .toDartString();
  }

  /// Free the memory for this reference
  void free() {
    if (_freed) return;

    _freed = true;
    _finalizer.detach(this);
    locate<LibGit2>().git_repository_free(_nativePointer);
  }
}
