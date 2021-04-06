import 'dart:io';

class PlatformWrapper {
  bool get isIOS => Platform.isIOS;
  bool get isAndroid => Platform.isAndroid;
  bool get isMacOS => Platform.isMacOS;
  bool get isFuchsia => Platform.isFuchsia;
  bool get isLinux => Platform.isLinux;
  bool get isWindows => Platform.isWindows;

  const PlatformWrapper();
}
