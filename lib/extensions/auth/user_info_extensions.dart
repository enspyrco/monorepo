import 'package:firebase_auth/firebase_auth.dart';
import 'package:flireator/models/auth/auth_provider_data.dart';

extension UserInfoExt on UserInfo {
  AuthProviderData toAuthProviderData() => AuthProviderData(
        providerId: providerId,
        uid: uid,
        displayName: displayName,
        photoUrl: photoUrl,
        email: email,
        phoneNumber: phoneNumber,
      );
}
