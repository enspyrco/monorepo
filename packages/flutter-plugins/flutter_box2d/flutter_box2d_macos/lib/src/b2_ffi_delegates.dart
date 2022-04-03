library b2_ffi_delegates;

import 'dart:ffi';

import 'package:flutter_box2d_platform_interface/flutter_box2d_platform_interface.dart';

part 'b2_ffi_delegates/b2_body_def_ffi.dart';
part 'b2_ffi_delegates/b2_body_ffi.dart';
part 'b2_ffi_delegates/b2_fixture_ffi.dart';
part 'b2_ffi_delegates/b2_polygon_shape_ffi.dart';
part 'b2_ffi_delegates/b2_shape_ffi.dart';
part 'b2_ffi_delegates/b2_vec2_ffi.dart';
part 'b2_ffi_delegates/b2_world_ffi.dart';

final DynamicLibrary _symbols = DynamicLibrary.process();

typedef EmptyConstructor = Pointer<Void> Function();
