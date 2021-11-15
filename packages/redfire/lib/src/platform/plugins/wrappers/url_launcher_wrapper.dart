import 'dart:ui';

import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlLauncherWrapper {
  Future<bool> launch(
    String urlString, {
    bool? forceSafariVC,
    bool forceWebView = false,
    bool enableJavaScript = false,
    bool enableDomStorage = false,
    bool universalLinksOnly = false,
    Map<String, String> headers = const <String, String>{},
    Brightness? statusBarBrightness,
    String? webOnlyWindowName,
  }) =>
      url_launcher.launch(
        urlString,
        forceSafariVC: forceSafariVC,
        forceWebView: forceWebView,
        enableJavaScript: enableJavaScript,
        enableDomStorage: enableDomStorage,
        universalLinksOnly: universalLinksOnly,
        headers: headers,
        statusBarBrightness: statusBarBrightness,
        webOnlyWindowName: webOnlyWindowName,
      );

  Future<bool> canLaunch(String urlString) => url_launcher.canLaunch(urlString);
}
