import 'package:googleapis/docs/v1.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'docs_api_test_doubles.mocks.dart';

@GenerateMocks([DocsApi, DocumentsResource])
class DocsApiTestDoubles {
  DocsApiTestDoubles();
}

enum DocsFunctionNamed { update, create }

MockDocsApi createDocsApiMockThatReturns(
    {required Document document, required DocsFunctionNamed onCalling}) {
  final mockDocsApi = MockDocsApi();
  final mockDocumentsResource = MockDocumentsResource();

  // Stub the DocsApi mock to return a DocumentsResourceApi mock that in turn
  // returns a Document with a given id when 'create' is called.
  when(mockDocsApi.documents).thenReturn(mockDocumentsResource);
  when(mockDocumentsResource.create(any))
      .thenAnswer((_) => Future.value(document));

  return mockDocsApi;
}
