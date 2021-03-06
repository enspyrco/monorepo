import 'dart:ui';

import 'package:redfire/types.dart';

class FakeUrlLauncherWrapper implements UrlLauncherWrapper {
  @override
  Future<bool> canLaunch(String urlString) => Future.value(true);

  @override
  Future<bool> launch(String urlString,
          {bool? forceSafariVC,
          bool forceWebView = false,
          bool enableJavaScript = false,
          bool enableDomStorage = false,
          bool universalLinksOnly = false,
          Map<String, String> headers = const <String, String>{},
          Brightness? statusBarBrightness,
          String? webOnlyWindowName}) =>
      Future.value(true);
}
