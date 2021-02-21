import 'package:googleapis/firestore/v1.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'firestore_api_test_doubles.mocks.dart';

@GenerateMocks([
  FirestoreApi,
  ProjectsResourceApi,
  ProjectsDatabasesResourceApi,
  ProjectsDatabasesDocumentsResourceApi,
])
class FirestoreApiTestDoubles {
  FirestoreApiTestDoubles();
}

enum FirestoreFunctionNamed { documentsGet }

MockFirestoreApi createFirestoreApiMockThatReturns(
    {required Document document, required FirestoreFunctionNamed onCalling}) {
  final mockFirestoreApi = MockFirestoreApi();
  final mockProjectsResourceApi = MockProjectsResourceApi();
  final mockProjectsDatabasesResourceApi = MockProjectsDatabasesResourceApi();
  final mockProjectsDatabasesDocumentsResourceApi =
      MockProjectsDatabasesDocumentsResourceApi();

  when(mockFirestoreApi.projects).thenReturn(mockProjectsResourceApi);
  when(mockProjectsResourceApi.databases)
      .thenReturn(mockProjectsDatabasesResourceApi);
  when(mockProjectsDatabasesResourceApi.documents)
      .thenReturn(mockProjectsDatabasesDocumentsResourceApi);
  when(mockProjectsDatabasesDocumentsResourceApi.get(any,
          mask_fieldPaths: anyNamed('mask_fieldPaths'),
          transaction: anyNamed('transaction'),
          readTime: anyNamed('readTime'),
          $fields: anyNamed('\$fields')))
      .thenAnswer((_) => Future.value(document));

  return mockFirestoreApi;
}
