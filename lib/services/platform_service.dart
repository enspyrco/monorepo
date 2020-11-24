import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:the_process/enums/platform/platform_enum.dart';
import 'package:url_launcher/url_launcher.dart';

class PlatformService {
  PlatformService();

  PlatformEnum detectPlatform() {
    if (kIsWeb) {
      return PlatformEnum.web;
    }
    if (Platform.isMacOS) {
      return PlatformEnum.macOS;
    }
    if (Platform.isFuchsia) {
      return PlatformEnum.fuchsia;
    }
    if (Platform.isLinux) {
      return PlatformEnum.linux;
    }
    if (Platform.isWindows) {
      return PlatformEnum.windows;
    }
    if (Platform.isIOS) {
      return PlatformEnum.iOS;
    }
    if (Platform.isAndroid) {
      return PlatformEnum.android;
    }
    return PlatformEnum.unknown;
  }

  Future<void> getAuthorized() async {
    const url =
        'https://us-central1-the-process-tool.cloudfunctions.net/getAuthorized?state=EmMNvzWZERdIpbk4cl3klhMPZg82';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
