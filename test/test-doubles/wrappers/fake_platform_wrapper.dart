import 'package:the_process/utils/wrappers/platform_wrapper.dart';

/// Returns true for isIOS, fake for everything else
class FakePlatformWrapper implements PlatformWrapper {
  @override
  bool get isAndroid => false;

  @override
  bool get isFuchsia => false;

  @override
  bool get isIOS => true;

  @override
  bool get isLinux => false;

  @override
  bool get isMacOS => false;

  @override
  bool get isWindows => false;
}
