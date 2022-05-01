python3 parse_and_generate.py Box2D.idl
cp out/b2_adapters_ffi.dart ../flutter_box2d_macos/lib/b2_adapters_ffi.dart
cp out/b2_adapters_web.dart ../flutter_box2d_web/lib/b2_adapters_web.dart
cp out/b2_decorators.dart ../flutter_box2d_platform_interface/lib/b2_decorators.dart
cp out/b2_delegates.dart ../flutter_box2d_platform_interface/lib/b2_delegates.dart
cp out/b2_enums.dart ../flutter_box2d_platform_interface/lib/b2_enums.dart
cp out/flutter_box2d_macos.dart ../flutter_box2d_macos/lib/flutter_box2d_macos.dart
cp out/flutter_box2d_platform_interface.dart ../flutter_box2d_platform_interface/lib/flutter_box2d_platform_interface.dart
cp out/flutter_box2d_web.dart ../flutter_box2d_web/lib/flutter_box2d_web.dart
dart format ../flutter_box2d_platform_interface/lib/ ../flutter_box2d_macos/lib/ ../flutter_box2d_web/lib/