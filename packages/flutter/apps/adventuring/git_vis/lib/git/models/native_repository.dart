import 'dart:ffi';

import 'package:astro_locator/astro_locator.dart';
import 'package:ffi/ffi.dart';
import 'package:git_vis/git/extensions/extensions.dart';
import 'package:git_vis/git/native_bindings/libgit2_bindings.dart';

import '../errors/native_error.dart';

class NativeRepository implements Finalizable {
  NativeRepository._(this._nativePointer) : _nativeLib = locate<LibGit2>();

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

  final LibGit2 _nativeLib;

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

  /// Fill a list with the names of references that can be found in the repository.
  List<String> listReferences() {
    final array = calloc<git_strarray>();
    final result = _nativeLib.git_reference_list(array, _nativePointer);
    final refNames = <String>[];

    if (result < 0) {
      throw NativeError(_nativeLib.git_error_last());
    } else {
      for (var i = 0; i < array.ref.count; i++) {
        refNames.add(array.ref.strings.elementAt(i).value.toDartString());
      }
    }

    calloc.free(array);

    return refNames;
  }

  /// Free the memory for this repository object.
  void free() {
    if (_freed) return;

    _freed = true;
    _finalizer.detach(this);
    _nativeLib.git_repository_free(_nativePointer);
  }
}
