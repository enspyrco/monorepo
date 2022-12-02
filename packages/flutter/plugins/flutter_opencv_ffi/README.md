# flutter_opencv_ffi

A Flutter FFI plugin for [OpenCV](https://opencv.org).

[Project Notes](https://www.notion.so/enspyrco/Flutter-OpenCV-FFI-b6781579b43c42289b5977c41c0f06a1)

## Getting started (using the plugin)

### Install

Add to `pubspec.yaml`:

```yaml
dev:
  flutter_opencv_ffi:
    git: ...
```

## Getting started (developing the plugin)

### Fetch submodules

```sh
git submodule update --init
```

The  two submodules are `opencv` (the open source computer vision library) and
`opencv_contrib` (a repository for OpenCV's extra modules).

### Build OpenCV

### Updating OpenCV version

Use git tags to select a version.

```sh
cd opencv && git pull
git tag // decide the tag/version you want to use
git checkout -b <tag_name> <tag_name>

cd .. && cd opencv_contrib && git pull
git checkout -b <tag_name> <tag_name> // use same as first tag
```

### General build (produces lots of dylibs)

Currently: assumes you are on MacOS arm64

Follow [OpenCV: Installation in MacOS](https://docs.opencv.org/4.x/d0/db2/tutorial_macos_install.html)

> I had to add -DBUILD_ZLIB=OFF to get past build errors, as per [this issue](https://github.com/opencv/opencv/issues/21389)

```sh
mkdir build_opencv && cd build_opencv
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=ON -DBUILD_ZLIB=OFF ../opencv
```

#### Build a Framework for MacOS

From project directory:

```sh
mkdir build_opencv_macos
python3 opencv/platforms/apple/build_xcframework.py --out build_opencv_macos --macos_archs x86_64,arm64 --build_only_specified_archs
mv build_opencv_macos/opencv2.xcframework macos // move the framework to where it is expected
rm -rf build_opencv_macos // clean up
```

## Project stucture

This project uses the following structure:

* `src`: Contains the native source code, and a CmakeFile.txt file for building
  that source code into a dynamic library.

* `lib`: Contains the Dart code that defines the API of the plugin, and which
  calls into the native code using `dart:ffi`.

* platform folders (`android`, `ios`, `windows`, etc.): Contains the build files
  for building and bundling the native code library with the platform application.
