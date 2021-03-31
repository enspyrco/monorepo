import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:the_process/enums/auth/provider_name.dart';
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

  Future<void> getAuthorized(
      {required ProviderName provider, required String state}) async {
    String url;
    if (provider == ProviderName.google) {
      url =
          'https://us-central1-the-process-tool.cloudfunctions.net/startGoogleAuthorization?state=$state';
    } else {
      // if (provider == Provider.asana)
      url =
          'https://us-central1-the-process-tool.cloudfunctions.net/startAsanaAuthorization?state=$state';
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
