part of '../b2_ffi_delegates.dart';

class B2FixtureFfi implements B2FixturePlatform {
  final Pointer<Void> _self;

  B2FixtureFfi._(Pointer<Void> ptr) : _self = ptr;
}
