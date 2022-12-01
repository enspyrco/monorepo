# git_vis

*Visualise git commit history & performing git commands with a delightful UI.*

~~We have re-implemented a tiny fraction of git so we can walk the commit tree, re-creating the relevant structure and details in-memory as a CommitTree object. We are now working on visualising the commit tree by drawing on a Flutter canvas.~~

## libgit2

We are using [libgit2](https://libgit2.org/) with [FFI](https://dart.dev/guides/libraries/c-interop).

### Get the submodule

We have a copy of libgit2 in the repo as a submodule, located in `git_vis/libgit2`

If the folder is empty, enter:

```sh
git submodule init
git submodule update
```

### Build a new version

To update the libgit2 binary used in git_vis, first update the submodule with a `git pull` then:

- Follow [libgit2/README > Build](https://github.com/libgit2/libgit2#building)

```sh
mkdir build && cd build
cmake ..
cmake --build .
cp ./libgit2.x.dylib ../../macos/Runner/Frameworks/libgit2.x.dylib
```

Regenerate the bindings

If ffigen is not setup, follow the setup instructions at [ffigen](https://pub.dev/packages/ffigen).

```sh
dart run ffigen
```
