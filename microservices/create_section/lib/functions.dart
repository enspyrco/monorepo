import 'dart:async';

import 'package:create_section/src/services/auth_service.dart';
import 'package:create_section/src/services/drive_service.dart';
import 'package:create_section/src/services/firestore_service.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:googleapis/docs/v1.dart' as docs;
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis/firestore/v1.dart' as firestore;
import 'package:googleapis/firestore/v1.dart';
import 'package:googleapis/secretmanager/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:shelf/shelf.dart';
import 'package:create_section/src/extensions/string_extensions.dart';

const adminUserId = '5rKQnmyI79WdJdSmblAuWbcybtw2';
const parentFolderId = '12K8H-Wb6WK_VRKAhl4XXZKkATciqie42';

@CloudFunction()
FutureOr<Response> function(Request request) async {
  // create a database entry object that will be added to and finally saved
  final docFields = <String, Value>{};
  try {
    // Create services and a client that will authenticate as the given user.
    final serviceClient =
        await clientViaApplicationDefaultCredentials(scopes: []);
    final firestoreService =
        FirestoreService(firestore.FirestoreApi(serviceClient));
    final authService = AuthService();
    final userClient = await authService.getUserClient(
      adminUserId,
      firestoreService,
      SecretManagerApi(serviceClient),
    );
    final driveService =
        DriveService(drive.DriveApi(userClient), docs.DocsApi(userClient));

    // Add the id of the user creating the section to the firestore document.
    docFields['createdBy'] = adminUserId.asValue();

    // Extract section name, update firestore doc and construct title strings
    final sectionName = request.requestedUri.queryParameters['name']!;
    docFields['name'] = sectionName.asValue();
    final folderTitle = '$sectionName: Sections Planning (CL)';
    final docTitle = '0 - Use Cases < $sectionName (CL)';

    // Use Drive API to create a folder for the section.
    final folder = await driveService.createFolder(
        name: folderTitle, parentId: parentFolderId);

    // Add the folder id to the firestore document for saving to db.
    docFields['folderId'] = folder.id!.asValue();

    // Create our use cases doc and move inside the section folder.
    final useCasesDriveDoc = await driveService.createDocInFolder(
        parentId: folder.id!, docTitle: docTitle);

    // Add the doc id to and save the firestore document.
    docFields['useCasesDocId'] = useCasesDriveDoc.id!.asValue();
    final savedFirestoreSectionDoc = await firestoreService
        .saveSection(firestore.Document()..fields = docFields);

    // Return the document id to the client.
    return Response.ok(savedFirestoreSectionDoc.name);
  } catch (error) {
    // Log and return any errors.
    print('$error\n\nSection doc fields: $docFields');
    return Response.internalServerError(body: error);
  }
}
