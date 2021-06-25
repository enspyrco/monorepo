import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:the_process/enums/auth/provider_name.dart';
import 'package:the_process/enums/platform/platform_enum.dart';
import 'package:the_process/utils/wrappers/platform_wrapper.dart';
import 'package:the_process/utils/wrappers/url_launcher_wrapper.dart';

class PlatformService {
  PlatformService(
      {PlatformWrapper? platformWrapper,
      UrlLauncherWrapper? urlLauncherWrapper})
      : _platformWrapper = platformWrapper ?? const PlatformWrapper(),
        _urlLauncherWrapper = urlLauncherWrapper ?? UrlLauncherWrapper();

  final UrlLauncherWrapper _urlLauncherWrapper;
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
