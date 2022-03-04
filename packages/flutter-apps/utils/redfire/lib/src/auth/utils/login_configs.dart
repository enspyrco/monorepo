import 'package:flutter/foundation.dart';
import 'package:flutterfire_ui/auth.dart';

abstract class LoginConfig {
  ProviderConfiguration toFlutterFireConfig();
}

// The flutterfire docs aren't clear why we need a clientId and seem to say to
// use the appId... need to look into it more and document here
class GoogleLoginConfig with LoginConfig {
  GoogleLoginConfig(this.clientId);

  final String clientId;

  @override
  ProviderConfiguration toFlutterFireConfig() =>
      GoogleProviderConfiguration(clientId: clientId);
}

class EmailLoginConfig with LoginConfig {
  @override
  ProviderConfiguration toFlutterFireConfig() =>
      const EmailProviderConfiguration();
}

class AppleLoginConfig with LoginConfig {
  @override
  ProviderConfiguration toFlutterFireConfig() =>
      const AppleProviderConfiguration();
}

/// A [PlatformDefaultLoginConfig] object can be included in the `logins` list
/// passed to the AppWidget and will result in a Sign In with Apple button on
/// ios and macos and a Google Sign In button on Android and web.
class PlatformDefaultLoginConfig with LoginConfig {
  PlatformDefaultLoginConfig({this.clientId});

  final String? clientId;

  @override
  ProviderConfiguration toFlutterFireConfig() {
    final platform = defaultTargetPlatform;
    if ((kIsWeb || platform == TargetPlatform.android) && clientId == null) {
      throw 'Web and Android use Google Sign in so using PlatformDefaultLoginConfig requires providing a clientId';
    }

    return (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS)
        ? const AppleProviderConfiguration()
        : GoogleProviderConfiguration(clientId: clientId!);
  }
}
