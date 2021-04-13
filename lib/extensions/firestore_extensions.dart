import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/enums/auth/provider_name.dart';
import 'package:the_process/extensions/string_extensions.dart';
import 'package:the_process/models/profile/profile_data.dart';
import 'package:the_process/models/sections/section.dart';

extension ConvertDocumentSnapshot on DocumentSnapshot {
  ProfileData toProfileData() {
    if (!exists) {
      throw 'snapshot indicated data does not exist';
    }
    // convert from the format of the firestore data (map of strings) to what
    // want (map of enums)
    final authorizationStatusAsStrings =
        data()?['authorizationStatus'] as Map<String, String>? ??
            <String, String>{};

    final authorizationStatus = authorizationStatusAsStrings
        .map<ProviderName, AuthorizationStep>((name, step) => MapEntry(
            name.toProviderNameEnum(), step.toAuthorizationStepEnum()));

    return ProfileData(
        id: id,
        displayName: data()?['displayName'] as String,
        photoURL: data()?['photoURL'] as String? ??
            'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
        firstName: data()?['firstName'] as String? ?? '_',
        lastName: data()?['lastName'] as String? ?? '_',
        authorizationStatus: authorizationStatus);
  }
}

extension ConvertQueryDocumentSnapshot on QueryDocumentSnapshot {
  Section toSection() => Section(
      name: data()['name'] as String,
      folderId: data()['folderId'] as String,
      useCasesDocId: data()['useCasesDocId'] as String);
}
