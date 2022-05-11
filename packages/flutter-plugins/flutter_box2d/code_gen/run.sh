python3 parse_and_generate.py Box2D.idl
mv out/b2_adapters_ffi.dart ../flutter_box2d_macos/lib/b2_adapters_ffi.dart
mv out/b2_adapters_web.dart ../flutter_box2d_web/lib/b2_adapters_web.dart
mv out/b2_decorators.dart ../flutter_box2d_platform_interface/lib/b2_decorators.dart
mv out/b2_delegates.dart ../flutter_box2d_platform_interface/lib/b2_delegates.dart
mv out/b2_enums.dart ../flutter_box2d_platform_interface/lib/b2_enums.dart
mv out/flutter_box2d_macos.dart ../flutter_box2d_macos/lib/flutter_box2d_macos.dart
mv out/flutter_box2d_platform_interface.dart ../flutter_box2d_platform_interface/lib/flutter_box2d_platform_interface.dart
mv out/flutter_box2d_web.dart ../flutter_box2d_web/lib/flutter_box2d_web.dart
rm out/glue.c
dart format ../flutter_box2d_platform_interface/lib/ ../flutter_box2d_macos/lib/ ../flutter_box2d_web/lib/