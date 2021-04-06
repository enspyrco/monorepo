import 'package:googleapis/firestore/v1.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'firestore_api_test_doubles.mocks.dart';

@GenerateMocks([
  FirestoreApi,
  ProjectsResource,
  ProjectsDatabasesResource,
  ProjectsDatabasesDocumentsResource,
])
class FirestoreApiTestDoubles {
  FirestoreApiTestDoubles();
}

enum FirestoreFunctionNamed { documentsGet }

MockFirestoreApi createFirestoreApiMockThatReturns(
    {required Document document, required FirestoreFunctionNamed onCalling}) {
  final mockFirestoreApi = MockFirestoreApi();
  final mockProjectsResource = MockProjectsResource();
  final mockProjectsDatabasesResource = MockProjectsDatabasesResource();
  final mockProjectsDatabasesDocumentsResource =
      MockProjectsDatabasesDocumentsResource();

  when(mockFirestoreApi.projects).thenReturn(mockProjectsResource);
  when(mockProjectsResource.databases)
      .thenReturn(mockProjectsDatabasesResource);
  when(mockProjectsDatabasesResource.documents)
      .thenReturn(mockProjectsDatabasesDocumentsResource);
  when(mockProjectsDatabasesDocumentsResource.get(any,
          mask_fieldPaths: anyNamed('mask_fieldPaths'),
          transaction: anyNamed('transaction'),
          readTime: anyNamed('readTime'),
          $fields: anyNamed('\$fields')))
      .thenAnswer((_) => Future.value(document));

  return mockFirestoreApi;
}
