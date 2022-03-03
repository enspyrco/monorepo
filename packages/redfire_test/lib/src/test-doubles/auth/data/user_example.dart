import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

import '../../../../redfire_test.dart';

class UserExample {
  static User stubBasicMock() {
    final mockUser = MockUser();

    when(mockUser.uid).thenReturn('uid');
    when(mockUser.tenantId).thenReturn(null);
    when(mockUser.displayName).thenReturn('displayName');
    when(mockUser.photoURL).thenReturn('photoURL');
    when(mockUser.email).thenReturn('email');
    when(mockUser.phoneNumber).thenReturn('phoneNumber');
    when(mockUser.metadata).thenReturn(UserMetadata(0, 0));
    when(mockUser.isAnonymous).thenReturn(false);
    when(mockUser.emailVerified).thenReturn(false);
    when(mockUser.providerData).thenReturn([]);

    return mockUser;
  }
}
