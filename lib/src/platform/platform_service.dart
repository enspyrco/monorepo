import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:redfire/src/platform/plugins/wrappers/platform_wrapper.dart';
import 'package:redfire/src/settings/enums/platform_enum.dart';

class PlatformService {
  PlatformService([PlatformWrapper? platformWrapper])
      : _platformWrapper = platformWrapper ?? PlatformWrapper();

  final PlatformWrapper _platformWrapper;

  PlatformEnum detectPlatform() {
    if (kIsWeb) {
      return PlatformEnum.web;
    }
    if (_platformWrapper.isMacOS) {
      return PlatformEnum.macOS;
    }
    if (_platformWrapper.isFuchsia) {
      return PlatformEnum.fuchsia;
    }
    if (_platformWrapper.isLinux) {
      return PlatformEnum.linux;
    }
    if (_platformWrapper.isWindows) {
      return PlatformEnum.windows;
    }
    if (_platformWrapper.isIOS) {
      return PlatformEnum.iOS;
    }
    if (_platformWrapper.isAndroid) {
      return PlatformEnum.android;
    }
    return PlatformEnum.unknown;
  }
}
