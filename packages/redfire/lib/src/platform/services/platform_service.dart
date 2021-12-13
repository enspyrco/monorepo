import 'package:flutter/foundation.dart' show kIsWeb;

import '../../auth/enums/providers_enum.dart';
import '../../settings/enums/platform_enum.dart';
import '../plugins/wrappers/platform_wrapper.dart';
import '../plugins/wrappers/url_launcher_wrapper.dart';

class PlatformService {
  PlatformService(
      {PlatformWrapper? platformWrapper,
      UrlLauncherWrapper? urlLauncherWrapper})
      : _platformWrapper = platformWrapper ?? const PlatformWrapper(),
        _urlLauncherWrapper = urlLauncherWrapper ?? UrlLauncherWrapper();

  final UrlLauncherWrapper _urlLauncherWrapper;
  final PlatformWrapper _platformWrapper;

  PlatformsEnum detectPlatform() {
    if (kIsWeb) {
      return PlatformsEnum.web;
    }
    if (_platformWrapper.isMacOS) {
      return PlatformsEnum.macOS;
    }
    if (_platformWrapper.isFuchsia) {
      return PlatformsEnum.fuchsia;
    }
    if (_platformWrapper.isLinux) {
      return PlatformsEnum.linux;
    }
    if (_platformWrapper.isWindows) {
      return PlatformsEnum.windows;
    }
    if (_platformWrapper.isIOS) {
      return PlatformsEnum.iOS;
    }
    if (_platformWrapper.isAndroid) {
      return PlatformsEnum.android;
    }
    return PlatformsEnum.unknown;
  }

  Future<void> getAuthorized(
      {required ProvidersEnum provider, required String state}) async {
    String url;
    if (provider == ProvidersEnum.google) {
      url =
          'https://us-central1-the-process-tool.cloudfunctions.net/startGoogleAuthorization?state=$state';
    } else {
      // if (provider == Provider.asana)
      url =
          'https://us-central1-the-process-tool.cloudfunctions.net/startAsanaAuthorization?state=$state';
    }

    if (await _urlLauncherWrapper.canLaunch(url)) {
      await _urlLauncherWrapper.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchUrl(String url) async {
    if (await _urlLauncherWrapper.canLaunch(url)) {
      await _urlLauncherWrapper.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
