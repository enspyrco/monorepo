import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_process/models/project_sections/project_section.dart';

extension ConvertQueryDocumentSnapshot on QueryDocumentSnapshot {
  ProjectSection toProjectSection() => ProjectSection(
      name: ['name'] as String,
      folderId: ['folderId'] as String,
      useCasesDocId: ['useCasesDocId'] as String);
}
