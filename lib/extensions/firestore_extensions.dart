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
        ['authorizationStatus'] as Map<String, String>? ?? <String, String>{};

    final authorizationStatus = authorizationStatusAsStrings
        .map<ProviderName, AuthorizationStep>((name, step) => MapEntry(
            name.toProviderNameEnum(), step.toAuthorizationStepEnum()));

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

extension ConvertQueryDocumentSnapshot on QueryDocumentSnapshot {
  Section toSection() => Section(
      name: ['name'] as String,
      folderId: ['folderId'] as String,
      useCasesDocId: ['useCasesDocId'] as String);
}
