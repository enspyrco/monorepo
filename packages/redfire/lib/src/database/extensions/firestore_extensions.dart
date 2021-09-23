import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redfire/src/profile/models/profile_data.dart';
import 'package:redfire/types.dart';

extension ConvertDocumentSnapshot on DocumentSnapshot {
  ProfileData toProfileData() {
    if (!exists) {
      throw 'snapshot indicated data does not exist';
    }
    // convert from the format of the firestore data (map of strings) to what
    // want (map of enums)
    final authorizationStatusAsStrings =
        ['authorizationStatus'] as Map<String, String>? ?? <String, String>{};

    final authorizationStatus = authorizationStatusAsStrings
        .map<ProvidersEnum, AuthorizationEnum>((name, step) =>
            MapEntry(name.toProvidersEnum(), step.toAuthorizationEnum()));

    return ProfileData(
        id: id,
        displayName: ['displayName'] as String,
        photoURL: ['photoURL'] as String? ??
            'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
        firstName: ['firstName'] as String? ?? '_',
        lastName: ['lastName'] as String? ?? '_',
        authorizationStatus: authorizationStatus);
  }
}

extension EnumParsers on String {
  ProvidersEnum toProvidersEnum() {
    return ProvidersEnum.values
        .firstWhere((e) => e.toString().toLowerCase() == 'providersEnum.$this');
  }

  AuthStepEnum toAuthStepEnum() {
    return AuthStepEnum.values.firstWhere(
        (e) => e.toString().toLowerCase() == 'authenticationEnum.$this');
  }

  AuthorizationEnum toAuthorizationEnum() {
    return AuthorizationEnum.values.firstWhere(
        (e) => e.toString().toLowerCase() == 'authorizationEnum.$this');
  }
}
