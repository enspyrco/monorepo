import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/models/profile/profile_data.dart';
import 'package:the_process/models/sections/section.dart';

extension ConvertDocumentSnapshot on DocumentSnapshot {
  ProfileData toProfileData() => ProfileData(
      id: id,
      displayName: data()['displayName'] as String,
      photoURL: data()['photoURL'] as String ??
          'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
      firstName: data()['firstName'] as String ?? '_',
      lastName: data()['lastName'] as String ?? '_',
      googleAuth: AuthorizationStep.valueOf(data()['googleAuth'] as String),
      asanaAuth: AuthorizationStep.valueOf(data()['asanaAuth'] as String));
}

extension ConvertQueryDocumentSnapshot on QueryDocumentSnapshot {
  Section toSection() => Section(
      name: data()['name'] as String,
      folderId: data()['folderId'] as String,
      useCasesDocId: data()['useCasesDocId'] as String);
}
