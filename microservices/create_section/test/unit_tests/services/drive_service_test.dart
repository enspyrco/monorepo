import 'package:create_section/src/services/drive_service.dart';
import 'package:googleapis/docs/v1.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../test_doubles/apis/docs_api_test_doubles.dart';
import '../../test_doubles/apis/docs_api_test_doubles.mocks.dart';
import '../../test_doubles/apis/drive_api_test_doubles.dart';
import '../../test_doubles/apis/drive_api_test_doubles.mocks.dart';

void main() {
  group('DriveService', () {
    ////////////// createDocInFolder
    // -- Order of events we want to test:
    // 1. Create a Document object with given title.
    // 2. Use the DocsApi to create the remote doc.
    // 3. Use the DriveApi to move the doc to the given folder.
    // 4. Return the updated File object.
    // -- What could go wrong?
    // 1. The DocsApi call could fail.
    // 2. The DriveApi call could fail.

    test(
        'createDocInFolder() calls DriveAPI\'s update() and returns the result',
        () async {
      // Create example data for the test.
      final exampleParentId = 'exampleParentId';
      final exampleDocumentId = 'exampleDocumentId';
      final exampleFile = File()
        ..id = exampleParentId
        ..parents = [exampleParentId];
      final exampleDocument = Document()..documentId = exampleDocumentId;

      // Create the test doubles.

      // Stub the DriveApi mock to return a FilesResourceApi mock that in turn
      // retruns a File, with the given id and parents when 'update' is called.
      final mockDriveApi = createDriveApiMockThatReturns(
          file: exampleFile, onCalling: DriveFunctionNamed.update);
      // Stub the DocsApi mock to return a DocumentsResourceApi mock that in turn
      // returns a Document with a given id when 'create' is called.
      final mockDocsApi = createDocsApiMockThatReturns(
          document: exampleDocument, onCalling: DocsFunctionNamed.create);

      // Create the subject under test.
      final service = DriveService(mockDriveApi, mockDocsApi);

      // Run the function we are testing.
      final result = await service.createDocInFolder(
          parentId: exampleParentId, docTitle: 'testDocTitle');

      // Check that the document returned by the DriveAPI when 'update' is called
      // is what we get back from the service.
      expect(result.parents, contains(exampleParentId));
    });

    test('createFolder() throws when docsApi throws', () async {
      final mockDriveApi = MockDriveApi();
      final mockDocsApi = MockDocsApi();

      when(mockDocsApi.documents).thenThrow(Exception('Whoop!'));

      // Create the subject under test.
      final service = DriveService(mockDriveApi, mockDocsApi);

      // Run the function we are testing.
      expect(
          service.createDocInFolder(
              parentId: 'exampleParentId', docTitle: 'testDocTitle'),
          throwsA(const TypeMatcher<Exception>()));
    });

    ////////////// createFolder
    // -- Order of events we want to test:
    // 1. Create a File object with 'folder' mimeType.
    // 2. If a parentId was passed in, add it to the Folder object.
    // 3. Use the Folder object to create a remote folder.
    // -- What could go wrong?
    // 1. The DriveApi call could fail.

    test('createFolder() ', () async {
      final exampleFolderName = 'exampleFolderName';
      final exampleFileId = 'exampleFileId';
      final exampleFile = File()..id = exampleFileId;
      final exampleDocumentId = 'exampleDocumentId';
      final exampleDocument = Document()..documentId = exampleDocumentId;

      final mockDriveApi = createDriveApiMockThatReturns(
          file: exampleFile, onCalling: DriveFunctionNamed.create);

      // Stub the DocsApi mock to return a DocumentsResourceApi mock that in turn
      // returns a Document with a given id when 'create' is called.
      final mockDocsApi = createDocsApiMockThatReturns(
          document: exampleDocument, onCalling: DocsFunctionNamed.create);

      // Create the subject under test.
      final service = DriveService(mockDriveApi, mockDocsApi);

      // Run the function we are testing.
      final result = await service.createFolder(name: exampleFolderName);

      // Check that the File returned by the DriveAPI when 'create' is called
      // is what we get back from the service.
      expect(result.id, exampleFileId);
    });

    test('createFolder() throws when ...', () async {});
  });
}
