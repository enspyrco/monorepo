import 'package:flireator/models/auth/auth_data.dart';

extension AuthDataExtension on AuthData {
  bool get hasGitHub => providers
      .where((provider) => provider.providerId == 'github.com')
      .isNotEmpty;
}
