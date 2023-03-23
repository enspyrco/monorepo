import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';

void main() {
  late final DynamicLibrary _symbols;

  TestWidgetsFlutterBinding.ensureInitialized();

  // TODO: decide how to get access to the 'flutter_box2d_macos' dylib
  // - probably a specific build that we can run for local testing or in the CI
  setUp(() {
    _symbols = DynamicLibrary.open(
        '/Users/nick/git/orgs/enspyrco/monorepo/packages/flutter-plugins/flutter_box2d/flutter_box2d/example/build/macos/Build/Products/Release/flutter_box2d_macos/flutter_box2d_macos.framework/Versions/Current/flutter_box2d_macos');
  });

  tearDown(() {});

  test('use symbol', () async {
    final _ctr2 = _symbols
        .lookup<NativeFunction<Pointer<Void> Function(Float, Float)>>(
            'dart_bind_b2Vec2_b2Vec2_2')
        .asFunction<Pointer<Void> Function(double, double)>();

    var vecPtr = _ctr2(1, 2);

    final _length = _symbols
        .lookup<NativeFunction<Float Function(Pointer<Void>)>>(
            'dart_bind_b2Vec2_Length_0')
        .asFunction<double Function(Pointer<Void>)>();

    print(_length(vecPtr));
  });
}
