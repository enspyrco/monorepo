import 'dart:io';

import 'package:create_section/src/services/auth_service.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:googleapis/docs/v1.dart';
import 'package:googleapis/secretmanager/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:test/test.dart';

import '../../test-doubles/services/fake_firestore_service.dart';

final enspyrTesterId = 'ayl3FcuCUVUmwpDGAvwI47ujyY32';

void main() {
  test('DriveAPI', () async {
    final serviceClient =
        await clientViaApplicationDefaultCredentials(scopes: []);
    final secretManagerApi = SecretManagerApi(serviceClient);
    final authService = AuthService();
    final fakeFirestoreService = FakeFirestoreService();
    final userClient = await authService.getUserClient(
      enspyrTesterId,
      fakeFirestoreService,
      secretManagerApi,
    );

    final driveApi = DriveApi(userClient);
    final docsApi = DocsApi(userClient);

    // create a top level folder
    final testFolder = File()
      ..name = 'Test Folder'
      ..mimeType = 'application/vnd.google-apps.folder';

    final savedTestFolder = await driveApi.files.create(testFolder);

    // create a google doc
    final useCasesDocument = Document()..title = 'Test Title';
    final savedDoc = await docsApi.documents.create(useCasesDocument);

    // move the doc inside the folder
    final updatedFile = await driveApi.files
        .update(File(), savedDoc.documentId!, addParents: savedTestFolder.id);

    // check the doc has the folder as a parent
    expect(updatedFile.parents, contains(savedTestFolder.id));
  });
}
