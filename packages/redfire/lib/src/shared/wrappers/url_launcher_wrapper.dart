import 'dart:ui';

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
      launch(
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

  Future<bool> canLaunch(String urlString) => canLaunch(urlString);
}
